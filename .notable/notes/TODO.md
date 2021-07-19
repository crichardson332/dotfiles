---
tags: [ACE]
title: TODO
created: '2021-04-07T03:59:23.474Z'
modified: '2021-05-11T16:13:33.581Z'
---

# TODO

### 2020-04-06
- MuJoCo license information for Eric
- GRA form
- Fix distances shape issues
  - obs.shape is (1000,60)
  - distances is currently masking the first index
    - need to change mask to second index 
    - Take the maximum over the 32 lidar indices, and then have a (1000,) array
    to compute `worst_case` on

### 2020-04-10
- Get actual true rewards and add to the batch that the custom_loss function sees

### 2020-04-12
- Peruse GT faculty with experience in RL
- Clear up infotuple 3 vs 5 question - deterministic oracle
- 

Two plots:
- how quickly does it learn relative to the policy
- safety characteristics - is it more safe

### 2021-05-04
- accuracy of barrier function
- experiment with large collision cost
- offset barrier function by 0.15
  - coeff of 100 empirically seems good for the 1-hazard 


- 
