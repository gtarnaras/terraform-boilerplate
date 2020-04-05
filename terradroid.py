#!/usr/bin/env python3
#title           : terradroid.py
#description     : This script is a simple terraform wrapper to deploy our infra.
#                  across different envs.
#author		     : Copyright (C) 2020, George Tarnaras
#date            : 20200204
#version         : 0.1
#usage		     : python terradroid.py
#==============================================================================


from jinja2 import Environment, PackageLoader
import os
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
    tf_commands={
                'plan':terra_plan,
                'apply':terra_apply,
                'destroy':terra_destroy
             }
    tf_commands.get(option,"Invalid terraform action")
    func = tf_commands.get(option,"Invalid terraform action")
    return func()

def load_env(aws_credentials_file, aws_profile, deploy_env):
    env = Environment(loader=PackageLoader('deploy-vars'))
    template = env.get_template('infrastructure-main')

    root = os.path.dirname(os.path.abspath(__file__))
    filename = os.path.join(root, 'infrastructure', 'main.tf')

    with open(filename, 'w') as fh:
        fh.write(template.render(
            shared_credentials_file = aws_credentials_file,
            profile = aws_profile,
            env = deploy_env,
        ))

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
load_env(config["AWS_CREDENTIALS_PATH"], config["AWS_PROFILE"], config["DEPLOY_ENVIRONMENT"])

tf_action = args.cmd
terra_action(tf_action)

