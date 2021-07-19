---
attachments: [Screenshot from 2021-03-16 22-36-17.png, Screenshot from 2021-03-23 13-02-59.png, Screenshot from 2021-03-25 23-06-40.png, Screenshot from 2021-03-26 13-25-59.png, Screenshot from 2021-04-02 08-04-50.png, Screenshot from 2021-04-10 11-07-38.png]
tags: [ACE]
title: rlcbf notes
created: '2021-03-17T02:42:38.378Z'
modified: '2021-04-10T15:09:26.415Z'
---

# rlcbf notes

### 2021-03-16
**CAR FOLLOWING**
- scaling factor = 1
- no soft boundary bonus
- collision boundary = 0

Results:
![](@attachment/Screenshot from 2021-03-16 22-36-17.png)

### 2021-03-23
**CAR FOLLOWING**
- scaling factor = 1
- no soft boundary bonus
- collision boundary = 0
- added 1000 reward for finishing the episode
Note: collisions are being incentivized because it ends the episode, and rewards are nonpositive
![](@attachment/Screenshot from 2021-03-23 13-02-59.png)

### 2021-03-25
**SAFETY GYM**
```
      env_config:
        robot_base: 'xmls/point.xml'
        task: 'goal'
        observe_goal_lidar: True
        observe_box_lidar: True
        observe_hazards: True
        observe_vases: True
        observe_pillars: True
        observe_gremlins: True
        # constrain_hazards: True
        constrain_pillars: True
        constrain_indicator: True
        lidar_max_dist: 3
        lidar_num_bins: 16
        hazards_num: 0
        pillars_num: 10
        vases_num: 0
```
![](@attachment/Screenshot from 2021-03-25 23-06-40.png)

```
  common:
    run_or_experiment: 'PPO'                                                                             
    checkpoint_freq: 1                                                                                   
    keep_checkpoints_num: 5                                                                              
    checkpoint_at_end: true                                                                              
    resume: false                                                                                        
    max_failures: 0                                                                                      
    stop:
      timesteps_total: 10000000                                                                          
    config:
      env: 'SafetyGymEngine'                                                                             
      framework: torch                                                                                   
      num_gpus: 1
      num_workers: 1                                                                                     
        
  safexp-carpush0:
    config:                                                                                              
      env_config:
        robot_base: 'xmls/point.xml'                                                                     
        task: 'goal'                                                                                     
        observe_goal_lidar: True                                                                         
        observe_box_lidar: True                                                                          
        observe_hazards: True                                                                            
        observe_vases: True
        observe_pillars: True
        observe_gremlins: True
        # constrain_hazards: True                                                                        
        constrain_pillars: True                                                                          
        constrain_indicator: True                                                                        
        lidar_max_dist: 4
        lidar_num_bins: 16                                                                               
        lidar_type: 'pseudo'                                                                             
        hazards_num: 0                                                                                   
        pillars_num: 10                                                                                  
        vases_num: 0
    
      gamma: 0.99
      lr: 0.001                                                                                          
      train_batch_size: 30000
      model:
        fcnet_hiddens: [256, 256]
        fcnet_activation: tanh
```
![](@attachment/Screenshot from 2021-03-26 13-25-59.png)

### 2021-04-01
```
  safety-point-goal2:                                                                                    
    config:                                                                                              
      env_config:                                                                                        
        robot_base: 'xmls/point.xml'                                                                     
        # common all                                                                                     
        observe_goal_lidar: True                                                                         
        observe_box_lidar: True                                                                          
        lidar_max_dist: 3                                                                                
        lidar_num_bins: 16                                                                               
        # common goal                                                                                    
        task: 'goal'                                                                                     
        goal_size: 0.3                                                                                   
        goal_keepout: 0.305                                                                              
        hazards_size: 0.2                                                                                
        hazards_keepout: 0.18                                                                            
        # common goal constrained                                                                        
        constrain_hazards: True                                                                          
        observe_hazards: True                                                                            
        observe_vases: True                                                                              
        # goal level 2                                                                                   
        placements_extents: [-2, -2, 2, 2]                                                               
        constrain_vases: True                                                                            
        hazards_num: 10                                                                                  
        vases_num: 10 
```
![](@attachment/Screenshot from 2021-04-02 08-04-50.png)

### 2021-04-10
- safety-point-goal2
- batch_size of 30,000
- barrier reward shaping OFF
![](@attachment/Screenshot from 2021-04-10 11-07-38.png)
