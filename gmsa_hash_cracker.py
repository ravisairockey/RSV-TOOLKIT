#!/usr/bin/env python3
import argparse
import sys
from binascii import hexlify
from Cryptodome.Hash import MD4

try:
    from impacket.structure import Structure
except ImportError:
    print("[-] Impacket not found. Please install it using: pip install impacket")
    sys.exit(1)

class MSDS_MANAGEDPASSWORD_BLOB(Structure):
    """
    Defines the structure of the msDS-ManagedPassword blob.
    [MS-ADTS]: https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/139f3470-2824-472a-9577-6e088359595a
    """
    structure = (
        ('Version', '<H'),
        ('Reserved', '<H'),
        ('Length', '<L'),
        ('CurrentPasswordOffset', '<H'),
        ('PreviousPasswordOffset', '<H'),
        ('QueryPasswordIntervalOffset', '<H'),
        ('UnchangedPasswordIntervalOffset', '<H'),
        ('CurrentPassword', ':'),
        ('PreviousPassword', ':'),
        ('QueryPasswordInterval', ':'),
        ('UnchangedPasswordInterval', ':'),
    )

    def __init__(self, data=None):
        Structure.__init__(self, data=data)

    def fromString(self, data):
        Structure.fromString(self, data)

        # Determine the end of the CurrentPassword field
        if self['PreviousPasswordOffset'] == 0:
            end_data_offset = self['QueryPasswordIntervalOffset']
        else:
            end_data_offset = self['PreviousPasswordOffset']

        self['CurrentPassword'] = self.rawData[self['CurrentPasswordOffset']:end_data_offset]

def calculate_ntlm_hash(password_blob):
    """
    Calculates the NTLM hash from the CurrentPassword field of the blob.
    """
    # The password in the blob is Unicode, so we take every second byte.
    # The actual password ends with two null bytes, which we must remove.
    unicode_password = password_blob[:-2]
    
    hash = MD4.new()
    hash.update(unicode_password)
    return hexlify(hash.digest()).decode("utf-8")

def main():
    parser = argparse.ArgumentParser(description="Calculate NTLM hash from a gMSA msDS-ManagedPassword data blob.")
    parser.add_argument("blob", help="The msDS-ManagedPassword data blob as a string of comma-separated byte values (e.g., '1,0,0,0,...').")
    
    if len(sys.argv) == 1:
        parser.print_help(sys.stderr)
        sys.exit(1)
        
    args = parser.parse_args()

    try:
        # Convert the input string of bytes into an actual bytes object
        byte_data = bytes([int(b) for b in args.blob.split(',')])
    except ValueError:
        print("[-] Error: Invalid blob format. Please provide a comma-separated string of byte values.", file=sys.stderr)
        sys.exit(1)

    blob_structure = MSDS_MANAGEDPASSWORD_BLOB()
    blob_structure.fromString(byte_data)
    
    ntlm_hash = calculate_ntlm_hash(blob_structure['CurrentPassword'])
    
    print(f"\n[+] gMSA NTLM Hash: {ntlm_hash}\n")

if __name__ == "__main__":
    main()
