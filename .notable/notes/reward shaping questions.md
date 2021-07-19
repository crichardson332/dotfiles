---
tags: [ACE]
title: barrier func/reward shaping questions
created: '2021-04-01T16:24:39.781Z'
modified: '2021-04-08T00:09:32.189Z'
---

# barrier func/reward shaping questions

### Links
https://docs.ray.io/en/master/rllib.html

### Questions
- How exactly does the MultiAgentEpisode API work, and how is it integrated into the rllib pipeling?
- `By default, all of these callbacks are no-ops` what does no-ops mean?
- How do we make sure to call the barrier function on the correct observations when they are configured?
- Is a batch a set of (o,a) pairs along a trajectory? Or a batch of trajectories?
- How do we set the `loss_inputs` dictionary?
  - Figure out why this didn't work:
  - https://docs.ray.io/en/master/rllib-models.html#customizing-preprocessors-and-models
  > Any complex observations (dicts, tuples, etc.) will be unpacked by __call__ before being passed to forward(). To access the flattened observation tensor, refer to input_dict[“obs_flat”].
  - https://github.com/ray-project/ray/issues/7896



### 
- env -> extract relevant features 
- callbacks -> compute barrier function hvec
- pass hvec to model -> train h(x)
```
dh = bf_val - prev_bf_val
bf_constraint = dh + self.alpha(prev_bf_val)
rew += min(0, bf_constraint)
```

### Notes

- safety-point-goal2 lidar obs locations:
  - hazards_lidar: start = 22, len = 16
  - vases_lidar  : start = 41, len = 16

### Issues
- `self.prev_bf_val` is nan on first step
- dont see barrier_loss in tensorboard

