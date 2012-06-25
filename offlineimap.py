import keyring

def get_password(account, service):
    return keyring.get_password(service, account)
