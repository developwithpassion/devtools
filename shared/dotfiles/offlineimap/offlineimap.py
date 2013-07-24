#!/usr/bin/python
import subprocess
import re

class NameMapping:
  def __init__(self, local_name, remote_name):
    self.local_name = local_name
    self.remote_name = remote_name

class LocalName:
  def __init__(self, folder):
    self.folder = folder

  def matches(self, mapping):
    return mapping.remote_name == self.folder

  def mapped_folder_name(self, mapping):
    return mapping.local_name
  
class RemoteName:
  def __init__(self, folder):
    self.folder = folder

  def matches(self, mapping):
    return mapping.local_name == self.folder

  def mapped_folder_name(self, mapping):
    return mapping.remote_name



def get_password(account):
  program ='/Users/jp/repositories/developwithpassion/devtools/automation/keychain/get_keychain_password'

  command = "{0} --account:{1} --command:find-internet-password".format(program, account)

  output = subprocess.check_output(command, shell=True)

  return output.rstrip()


def is_included(folder):
  result = True

  for pattern in exclusion_patterns:
    result = result and (re.search(pattern, folder) == None)

  return result

exclusion_patterns = [
  "efax",
  "earth_class_mail",
  "eventbrite",
  "gotomeeting",
  "moshi_monsters",
  "peepcode",
  "raini_fowl",
  "stuart_know",
  "training.*2008",
  "training.*2009",
  "training.*2010",
  "training.*2011",
  "training.*2012",
  "training.*nbdn",
  "training.*nothin_but_bdd",
  "unblock_us",
  "web_hosting",
  "webinars",
  "Gmail.*Important"
]

name_mappings = [
  NameMapping('sent', '[Gmail]/Sent Mail'),
  NameMapping('spam', '[Gmail]/Spam'),
  NameMapping('flagged', '[Gmail]/Starred'),
  NameMapping('trash',   '[Gmail]/Trash'),
  NameMapping('archive', '[Gmail]/All Mail'),
  NameMapping('drafts', '[Gmail]/Drafts')
]



def find_name_mapping(name):
  default_mapping = NameMapping(name.folder, name.folder)

  for mapping in name_mappings:
    if (name.matches(mapping)):
      return mapping

  return default_mapping

def get_name_mapping(name):
  mapping = find_name_mapping(name)
  return name.mapped_folder_name(mapping)

def get_remote_name(local_folder_name):
  name = RemoteName(local_folder_name)
  return get_name_mapping(name)

def get_local_name(remote_folder_name):
  name = LocalName(remote_folder_name)
  return get_name_mapping(name)
