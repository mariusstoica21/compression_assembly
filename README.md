

<!-- <p align="left">
  <img 
    src="https://github.com/mariusstoica21/compression_assembly/blob/main/Images/Header.png"
  >
</p> -->

<p align="left">
  <img 
    src="https://i.postimg.cc/GtPYddVJ/Component-74-1.png"
  >
</p>





# Compression - Assembly x86 and Delphi

A desktop application that compresses an input text and creates a dictionary based on the compression.

The user can write an input text, for example, "Ana has apples. George has apples." and the app wil compress the text into "0 1 2. 3 1 2.", a smaller string. 
The app will also display the dictionary created, based on the input text and the compression result (0 - ana, 1 - has, 2 - apples, 3 - george).

The desktop app was created in Delphi, while the compression app was developed in assembly x86. In the desktop application, when the user presses the 'Start'
button in order to compress the input text, the desktop app will run "compresssion_asm.exe", which will compress the input text into the smaller string.

The project consists of two main components:
- Assembly x86 component
  - the assembly app reads the input text from a file and compresses it, creating an output text, much smaller in size, and a dictionary;
  - the output text is stored in "Others/output.txt", while the dictionary is saved in "Others/dict.txt".
- Delphi component
  - the desktop app offers the opportunity for the user to write an input text and start the compression;
  - the input text is stored in "Others/text.txt";
  - after the compression has taken place, the desktop app reads the resulted text and the dictionary and outputs them.

## Installation
- Go to https://github.com/mariusstoica21/compression_assembly.
- Click the green **'Code'** button.
- Click **'Download ZIP'**.
- Run the app by double-clicking **'Compression.exe'**.

## Summary
✅ G.U.I. 

✅ Ease of installation

❌ Additional hardware needed

✅ [Video available](https://www.youtube.com/watch?v=vidM-akudIY&list=PLepK0OW96HDlO9ZFQbR8YJ2-4iCYCZgcQ&index=2)

❌ Documentation


## Project description

### Folder structure

📁 Delphi_files : contains the Delphi project (it can be imported).

- 📄 [UPrincP.pas](https://github.com/mariusstoica21/compression_assembly/blob/main/Delphi_files/UPrincP.pas): main form of the app.

📁 Others : contains files requied for the application flow.
  - 📄 encrdecr.txt : file that contains '0' for compression, '1' for decompression.
  - 📄 text.txt : input text written by user in order to compress it.
  - 📄 output.txt : the result after the compression.
  - 📄 dict.txt : dictionary created after the execution of compression.
📄 [compression.asm](https://github.com/mariusstoica21/compression_assembly/blob/main/compression.asm)
: assembly_x86 file.

▶️ compression_asm.exe : assembly file that reads the input text and compresses it into a smaller string.

▶️ Compression.exe : application executable.


### Technologies

<table>
  <tr>
    <th>🔨 Tools/Framework</th>
    <th>📘 Language</th>
    <th>📃 Usage </th>
    <th>📚 Files</th>
    <th> ℹ Details  </th>
  </tr>
  <tr>
    <td>Delphi</td>
    <td>Objective Pascal</td>
    <td>Desktop app & GUI</td>
    <td>UPrincP.pas</td>
    <td>
       <ul>
        <li>UPrincP.pas is the main form of the desktop application.</li>
        <li>The user can write the input text in the 'Text'area.</li>
        <li>By pressing the 'Start' button, the text will be compressed into a smaller text, that will be displayed.</li>
        <li>A dictionary based on the compression will also be displayed.</li>
        <li>By pressing the 'Reset' button, the proccess of compression will be reinitialized.</li>
      </ul>
   </td>
  </tr>
  <tr>
    <td>Notepad++ MASM</td>
    <td>Assembly x86</td>
    <td>Read input and perform operations</td>
    <td>calculator.asm</td>
    <td>
       <ul>
        <li>Others/calculator.exe is the executable file of calculator.asm.</li>
        <li>The assembly app reads the input text from a file and compresses it, creating an output text, much smaller in size, and a dictionary</li>
        <li>The output text and the dictionary are saved in separate files.</li>
      </ul>
   </td>
  </tr>
</table>

## Tutorial

The first step is to run the app by following the Installation topic above. The user will write the desired text in the "Text" area and will press
the 'Start' button in order to execute the compression.

<p align="center">
  <img 
    src="https://i.postimg.cc/bJZkkTFX/7.jpg"
  >
</p>

After pressing the 'Start' button, the input text is compressed. The result of the compression is showed in the "Result" area, while the dictionary
generated based on the compression is displayed in the "Dictionary" area. In order to restart the process, the user may press the 'Restart' button.

<p align="center">
  <img 
    src="https://i.postimg.cc/dt2d2Dn0/8.jpg"
  >
</p>


## Authors

- [@mariusstoica21](https://github.com/mariusstoica21)

