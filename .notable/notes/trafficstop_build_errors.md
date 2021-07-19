---
attachments: []
tags: [trafficstop]
title: trafficstop build issues
created: '2021-03-17T02:42:38.378Z'
modified: '2021-04-10T15:09:26.415Z'
---

# trafficstop build issues

### 2021-06-22
- Inside docker container, running python setup in `gtri-uav-setup`
```
uav@df3feeb6c889:~/trafficstop-integration/submodules/gtri-uav/python/packages/gtri_uav_setup$ /usr/bin/python2.7 setup.py develop --prefix=/home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env
/usr/lib/python2.7/distutils/dist.py:267: UserWarning: Unknown distribution option: 'python_requires'
  warnings.warn(msg)
/usr/lib/python2.7/distutils/dist.py:267: UserWarning: Unknown distribution option: 'long_description_content_type'
  warnings.warn(msg)
running develop
running egg_info
writing requirements to gtri_uav_setup.egg-info/requires.txt
writing gtri_uav_setup.egg-info/PKG-INFO
writing top-level names to gtri_uav_setup.egg-info/top_level.txt
writing dependency_links to gtri_uav_setup.egg-info/dependency_links.txt
writing entry points to gtri_uav_setup.egg-info/entry_points.txt
reading manifest file 'gtri_uav_setup.egg-info/SOURCES.txt'
reading manifest template 'MANIFEST.in'
warning: no files found matching 'gtri_uav/setup/templates/*'
writing manifest file 'gtri_uav_setup.egg-info/SOURCES.txt'
running build_ext
Creating /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/lib/python2.7/site-packages/gtri-uav-setup.egg-link (link to .)
gtri-uav-setup 0.0.1 is already the active version in easy-install.pth
Installing apt_sources script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing gatherdebs script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing restartuavs script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing local_ssh_keygen_reset script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing uav script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing dependencies script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing run_autonomy script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing sendplaybook script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing touavs script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin
Installing fromuavs script to /home/uav/trafficstop-integration/build/submodules/gtri-uav/uav_resources/python-env/bin

Installed /home/uav/trafficstop-integration/submodules/gtri-uav/python/packages/gtri_uav_setup
Processing dependencies for gtri-uav-setup==0.0.1
Searching for wheel
Reading https://pypi.python.org/simple/wheel/
Couldn't find index page for 'wheel' (maybe misspelled?)
Scanning index of all packages (this may take a while)
Reading https://pypi.python.org/simple/
No local packages or download links found for wheel
error: Could not find suitable distribution for Requirement.parse('wheel')
uav@df3feeb6c889:~/trafficstop-integration/submodules/gtri-uav/python/packages/gtri_uav_setup$
```
