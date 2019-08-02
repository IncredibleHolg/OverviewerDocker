# This is a testrender config filee render definitions below.
worlds['Nitrado vanilla'] = "/home/hdunkel/WRK/GIT/GitHub/Overviewer-Rendertest/rendertest19/"
texturepath = "/home/hdunkel/WRK/Minecraft/ResourcepackWRK/Externals/original1.14"

# Define where to put the output here.
outputdir = "/home/hdunkel/WRK/GIT/GitHub/Overviewer-Rendertest/test-map"


rendermode = "lighting"
end_lighting = [Base(), EdgeLines(), Lighting(strength=0.5)]
end_smooth_lighting = [Base(), EdgeLines(), SmoothLighting(strength=0.5)]

renders["render1"] = {
        'world': 'Nitrado vanilla',
        'title': 'Nitrado Vanilla',
}
