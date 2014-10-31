##[Game Design Document]

#### SHMUP
- Borderlands style weapons
  - (@Eiyeron) Borderlands tracks the weapons as a combinaison of differents parts as the canon, the handle, etc...
    - Power
    - Firing Accuracy
    - Firing Frequency (how much bullets per seconds can be fired)
    - Reloading length (Note : the parts have different reloading animations. A pistol barrel on't have the same reloading than a shotgun)
    - Zoom
    ...
  - (@Eiyeron) Here's a list of the caracteristics we could track
    - Speed
    - Power
    - Trajectory / curviness (if it curves a lot of if it does only a little curve)
    - Speed
    - Firing Cadency
    - Energy used for a shot (if we'll use a energy system)
    - Cost (for the part and a fusion factor)
    - And obviously, graphics.
- ProcGen Terrain
  - (@Eiyeron) If it's a space shmup (hello, originality), Proc gen could be used to design planets as KSP (Kerbal Space Program) does or a lot of procgen games (like roguelikes)
  - (@Eiyeron) The main advantage with using pseudo-random functionbs like Simplex is the lossless details. Just add on the fly more octaves / calculation passses and you'll have as much details as you want.
  - (@Eiyeron) I should have some old prototypes here and there. I could bring them up for dissection.


## Weapon parts (@Eiyeron's ideas)

- Cannon
	=> Affects : missile type, precision
- Body             : Can be though about the part which will convert energy into missile or bring it to the cannon.
	=> Affects : firing speed, energy used
- Tech Core module : Think it like a CPU which manage the weapon's resource.
	=> Affects : reloading speed, energy used, (repairing?)
- Ammo Storage
	=> Affects : firing speed, Ammo clip quantity


### Legendary / Unique weapons creation ideas.

1.  Some "unique" weapons are actually a set of parts which only set with themselves.
2.  Some "unique" weapons are actually containing a legendary part which brings the legendary status.
3.  Hardcoded legendary weapons
