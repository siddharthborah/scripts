#!/usr/bin/env python3
import argparse
import webbrowser

def modify_url(uuid, time_range='7d', eu=False):
    hostname = 'app-nl.logz.io' if eu else 'app-wa.logz.io'
    url = f"https://{hostname}/#/dashboard/osd/discover/?_a=(columns:!(msg),filters:!((meta:(alias:!n,disabled:!f,index:'logzioCustomerIndex*',key:taskchain_id,negate:!f,params:(query:'{uuid}'),type:phrase),query:(match_phrase:(taskchain_id:'{uuid}')))),index:'logzioCustomerIndex*')&_g=(time:(from:now-{time_range},to:now))"
    if eu:
        url += "&switchToAccountId=389844&accountIds=389844"
    else:
        url += "&switchToAccountId=387910&accountIds=387910"
    return url

def main():
    """
    Main function to handle command-line arguments and display the modified URL.
    """
    parser = argparse.ArgumentParser(description='Modify and display URL with UUID and time range')
    parser.add_argument('taskchain_id', type=str, help='New UUID to replace in the URL')
    parser.add_argument('--time-range', '-t', type=str, default='7d', help='Time range for the URL')
    parser.add_argument('--no-open', action='store_true', help='Do not open the URL in the default web browser')
    parser.add_argument('--eu', action='store_true', help='Use app-nl.logz.io for EU')
    args = parser.parse_args()

    modified_url = modify_url(args.taskchain_id, args.time_range, args.eu)

    if not args.no_open:
        # Try to open the URL in the default web browser
        try:
            webbrowser.open(modified_url)
        except webbrowser.Error:
            print("Cannot open URL. Please open the following URL manually:")
            print(modified_url)
    else:
        print(modified_url)

if __name__ == '__main__':
    main()
