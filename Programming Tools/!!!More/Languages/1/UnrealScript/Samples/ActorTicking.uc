Object ticking
   Pre-physics
      controller (input)
      pawn (script)
      Components
         SkeletalMeshComponent: update animations, skeleton controls, then compute the matrices
   Physics, async
      pawn physics
   Post-physics
   Camera tick
   Viewport tick

   "server travelling"
   "client travelling"
   streaming

Render
   Calculate VP matrix (ask camera in script, returns cached value)
   Controller.PreRender
      UTPawn.PreRender (pretty good thing for licencees to use as well)
   Render everything

Audio

Callgraph computation
