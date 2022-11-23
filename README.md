# CGP_Shader_Miniproject: Sudo Light Shader
##### Description:
This is a unity project used to demo a self made sudo light shader made to replicate the shading used in the steam game [Crypt](https://store.steampowered.com/app/2138700/Crypt/). The Sample Scene, in the scene folder, provides a simple testing environment for the player to move within, it utilises a 3rd person camera through the cinemachine plugin in order to allow viewing behind surfaces. It was created to fulfill the mini project requirements for the computer graphics programming course as part of the Medialogy 5th semester 2022 and Aalborg university Denmark. 
The PowerPoint presentation required under the aforementioned guidelines can be found within the route folder of the GitHub repository.
***

##### Installation:
To install the shader testing environment, clone the GitHub repo and open the "...\CGP_Shader_Miniproject\CGPMiniProj" in unity. From there open the sample scene within the scene folder to access the testing environment. Once started the object materials will change to that specified within the public path variable for each *"Pos To Shader"* script instance so no materials will be visible within the editing environment.
***

##### Usage:
There are two shaders implemented within the testing environment a "Sudo Light Shader" and a "Pixelation Filter Shader".

###### *Sudo Light Shader Required Prerequisites & Usage:*
Default folder structure of the sudo light shader components:
- Material *"Assets/Resources/Materials/Shading Surface"* ★
- Shader Script *"Assets/Materials/Shaders/Retro Sudo Light Shader"*
- cs Script *"Assets/Scripts/Pos To Shader* - **(Apply to every game object in which you wish to apply the sudo light shader to, the script applies the shader to the object on start-up)**

By default, the sudo lighting shader is based around the position of a game object name *"Focal Point"*, This though can be changed in the public variables for any instance of the script. Within the script's public variables, the shading surface path can also be changed (While moveable it is required to be within the *"Assets/Resources/... /Shading Surface"* folder or a child folder thereof) ★
*Adjusting both the various ranges and colors for the shader can be done within the material parameters*

###### *Pixelation Filter Usage:*
Default folder structure of the pixelation filter shader components:
- Material *"Assets/Resources/Materials/Shading Surface"*
- Shader *"Assets/Materials/Shaders/Pixelation"*
- cs Script *"Assets/Scripts/Pixel Shader Handeler*

To use the pixelation filter apply the material and cs script to the camera and adjust material parameters to change the strength of the pixelation effect.
- Resolution adjusts the effect strength **(main adjustment point) **
- Pixel Width and Height Changes the relative size of each pixel
***

##### Authors:
**Name & nr:** Sebastian Whitehead - 20204586
**Course:** Computer Graphics Programming
**Study:** Med5
**Due date:** 02/12/2022 
***

### Sources:
Through the production of this testing environment server sources were referenced for both inspiration and implementation instructions. This section lists the utilised sources and models in conjunction with the project. 

##### General:
- [Crypt-Steam](https://store.steampowered.com/app/2138700/Crypt/)
- [Simple Pixelation Shader Tutorial](https://www.youtube.com/watch?v=bz7MStTq950)
- [Cinemachine Unity Plugin](https://unity.com/unity/features/editor/art-and-design/cinemachine)
- [THIRD PERSON MOVEMENT in 11 MINUTES - Unity Tutorial](https://www.youtube.com/watch?v=UCwwn2q4Vys)

##### Models:
- [Player Model Hat](https://sketchfab.com/3d-models/dippers-cap-6b247c088f034d09908d4ee78c39dd18)
- [Low Polly Pillar](https://sketchfab.com/3d-models/low-poly-pillar-c0484c2e23b14bdfa3d0451d8a72dcd4)
- [Tomb](https://sketchfab.com/3d-models/tomb-coffin-02ec65515e8a4f88a98a96b9b634a069)
- [Brazier](https://sketchfab.com/3d-models/lowpoly-stylized-brazier-7a6e5a855c8544dc897e6c5cebd641a2)
