#!/usr/bin/env python3
#title           : terradroid.py
#description     : This script is a simple terraform wrapper to deploy our infra.
#                  across different envs.
#author		     : Copyright (C) 2020, George Tarnaras
#date            : 20200204
#version         : 0.1
#usage		     : python terradroid.py
#==============================================================================

import argparse
import sys
import yaml

########################################################
################       VARS        #####################
########################################################

parser = argparse.ArgumentParser(
                        description=
                        'Simple wrapper to deploy your terraform \
                        infrastructure using a specific env')

parser.add_argument(
                        '--config',
                        metavar = 'config',
                        type = str,
                        help = 'The path to the configuration file that this script will use'
                    )

parser.add_argument(
                        '--cmd',
                        metavar = 'plan, apply, destroy',
                        type = str,
                        choices = ['plan','apply','destroy'],
                        help = 'Terraform command to run'
                    )

########################################################
################     FUNCTIONS     #####################
########################################################

def read_config():
    with open(config_file_path) as f:
        data = f.read()
    config = yaml.safe_load(data)
    return config

def terra_action(option):
    switcher={
                'plan':terra_plan(),
                'apply':terra_apply(),
                'destroy':terra_destroy()
             }
    return switcher.get(option,"Invalid terraform action")

def terra_plan():
    print("plan")

def terra_apply():
    print("apply")

def terra_destroy():
    print("destroy")

########################################################
################       MAIN        #####################
########################################################

if len(sys.argv) < 2:
    parser.print_usage()
    sys.exit(1)

args = parser.parse_args()
config_file_path = args.config
config = read_config()

tf_action = args.cmd
terra_action(tf_action)