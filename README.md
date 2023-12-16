This activity seeks to promote awareness and prowess in healthcare media literacy by playing, developing and designing a 2D digital game. This program was created in the context of the research project PLAYMUTATION2 (UIDB/05460/2020) and is directed towards adolescents (12-18 years old) and young adults (19-35 years old) to promote the development of STEAM competencies: Science, Technology, Engineering, Arts and Mathematics. 

Poll of Lies is a 2D game that challenges the player to think critically about the information contained in different social media posts, trying to figure out which ones are true based on media literacy principles, such as checking the source and its reputation, verifying the date, recognizing bias, among others. The development of this game is carried out using Godot, a beginner-friendly game engine that does not require installation. Godot uses a simple, high-level, programming language, GDScript, and has updated documentation and active forums to discuss information.

Activity created by [Carolina Araújo](https://github.com/carolinaaraujo00).\
Game developed by [Carolina Araújo](https://github.com/carolinaaraujo00) and [Francisco Pinto](https://github.com/Franciscorp).

---
## Repository organization

**├── COMPLETE_Poll_Of_Lies**\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fully functional version of the game. 

**├── Workshop 3**\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **├── Mission4_Materials**\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── spritesheet_template.png\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── spritesheet_cat.png\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **├── game-it-yourself-poll/Poll Of Lies**\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Game-It-Yourself Toolbox's incomplete version of the game for the workshop purposes.\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; **├── Game_It_Yourself_Level_2.pdf**\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Game-It-Yourself Toolbox's Level 2 guided document.


---
## Poll of Lies

**NOTE:** TO RUN THE GAME IN GODOT, DUE TO VERSION DIFFERENCES, IT MIGHT BE NECESSARY TO OPEN, CLOSE AND REOPEN THE PROJECT.

This game involves players in an activity designed to improve their media literacy skills.

From a simple, user-friendly menu that introduces the game's goal, the players move onto a screen displaying two distinct healthcare-related social media posts. One of these posts contains false, unsubstantiated, and/or misleading information, while the other is true and accurate. Consequently, the player must utilize the internet to search for information that helps determine which post is truthful.

The fake posts are generated using the online tool [Zeoob](https://zeoob.com/), **intended solely for educational purposes such as this**. Participants are encouraged to witness the simplicity of creating a deceptively authentic social media post. This experience is designed to foster critical thinking skills for future online endeavours.

---
Conceptually, this game strives to:
- Highlight the fallacy that everything encountered on the internet is accurate;
- Promote the development of critical thinking, principles of media literacy, and proficiency in internet searching;
- Encourage the dissemination of accurate healthcare information.
  
---
**Workshop 3 of the Game-It-Yourself Toolbox** seeks to impart fundamental concepts of game development and object-oriented programming through guided exercises to reconstruct missing pieces and mechanics of the game. These exercises include:  

- Familiarization with Godot's interface, scenes and node-based system;
- Executing actions upon button clicks through signals;
- Managing transitions between scenes;
- Generate new **fake** healthcare-related social media posts and import images into the game;
- Understand and manipulate different types of data (boolean, string, integer, float, Texture2D [native to Godot]) and data structures (array);
- Understand and use logic structures to control the flow of code execution (selection, i.e. if-else conditions);
- Update and display score;
- Add the participant's name to the game's credits;
- Design a custom sprite sheet, and create and add to the game an AnimatedSprite2D that animates the aforementioned sprite sheet;
- Export the game.
