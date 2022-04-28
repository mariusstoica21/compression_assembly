

<p align="left">
  <img 
    src="https://github.com/mariusstoica21/compression_assembly/blob/main/Images/Header.png"
  >
</p>



# Compression - Assembly x86 and Delphi

A desktop application that compresses an input text and creates a dictionary based on the compression.

The user can write an input text, for example, "Ana has apples. George has apples." and the app wil compress the text into "0 1 2. 3 1 2.", a smaller string. 
The app will also display the dictionary created, based on the input text and the compression result (0 - ana, 1 - has, 2 - apples, 3 - george).

The desktop app was created in Delphi, while the compression app was developed in assembly x86. In the desktop application, when the user presses the 'Start'
button in order to compress the input text, the desktop app will run "compresssion_asm.exe", which will compress the input text into the smaller string.

<!-- <p align="center">
  <img 
    src="https://i.postimg.cc/SNctvm48/Component-14-1.jpg"
  >
</p> -->


## Installation
- Go to https://github.com/mariusstoica21/calculator_asmx86.
- Click the green **'Code'** button.
- Click **'Download ZIP'**.
- Run the app by double-clicking **'calculator.exe'** in the 'calculator_asmx86_master' 
folder.

## Summary
✅ G.U.I. 

✅ Ease of installation

❌ Additional hardware needed

✅ Video available

❌ Documentation

## Project description

### Folder structure

📁 Delphi_files : contains the Delphi project (it can be imported).

- 📄 [UPrincP.pas](https://github.com/mariusstoica21/calculator_asmx86/blob/master/Delphi_files/UPrincP.pas): main form of the app.

📁 Others : contains files requied for the application flow.
    
📄 [calculator.asm](https://github.com/mariusstoica21/calculator_asmx86/blob/master/calculator.asm)
: assembly_x86 file.

▶️ Calculator.exe : application executable.

### Technologies

<!-- 
| 🔨 Tools/Frameworks |     📘 Language     |              📃 Usage               |     📚 Files     |                                ℹ Details                               |
|:----------------:|:----------------:|:---------------------------------:|:--------------:|:--------------------------------------------------------------------:|
|      Delphi      | Objective Pascal |         Desktop app & GUI         |   UPrincP.pas  |UPrincP.pas is the main form of the desktop application. The user presses the buttons in order to insert the operation. After clicking the '=' button, the operation is saved in Others/filename.txt and Others/calculator.exe is run|
|  Notepad++ MASM  |   Assembly x86   | Read input and perform operations | calculator.asm |Others/calculator.exe is the executable file of calculator.asm. The assembly app reads the string operation from Others/filename.txt, parses it and executes the arithmetical operations. The result is stored in result.txt, and read into the dektop app. | -->


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
        <li>The user presses the buttons in order to insert the operation.</li>
        <li>After clicking the '=' button, the operation is saved in Others/filename.txt and Others/calculator.exe is run.</li>
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
        <li>The assembly app reads the string operation from Others/filename.txt, parses it and executes the arithmetical operations.</li>
        <li>The result is stored in result.txt, and read into the dektop app.</li>
      </ul>
   </td>
  </tr>
</table>



## Tutorial


<p align="center">
  <img 
    src="https://i.postimg.cc/hjvt24TW/Component-25-1.png"
  >
</p>


## Authors

- [@mariusstoica21](https://github.com/mariusstoica21)

