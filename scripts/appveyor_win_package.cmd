7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip %APPVEYOR_BUILD_FOLDER%\build\lc0.exe
appveyor DownloadFile "https://ci.appveyor.com/api/projects/LeelaChessZero/lczero-client/artifacts/client.exe?branch=release&pr=false&job=Environment%%3A%%20NAME%%3D.exe%%2C%%20GOOS%%3Dwindows"
7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip client.exe
type COPYING |more /P > dist\COPYING
7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip .\dist\COPYING
7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip c:\cache\591226.pb.gz
IF %CUDA%==true copy lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%-nodll.zip
IF %NAME%==cpu-openblas 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip C:\cache\OpenBLAS\dist64\bin\libopenblas.dll
IF %NAME%==cpu-dnnl 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip C:\cache\dnnl_win_1.1.1_cpu_vcomp\bin\dnnl.dll
IF %OPENCL%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip C:\cache\opencl-nug.0.777.77\build\native\bin\OpenCL.dll
IF %CUDA%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip "%CUDA_PATH%\bin\cudart64_100.dll" "%CUDA_PATH%\bin\cublas64_100.dll"
IF %CUDA%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip "%PKG_FOLDER%\cuda\bin\cudnn64_7.dll"
IF %NAME%==cpu-dnnl copy "%PKG_FOLDER%\dnnl_win_1.1.1_cpu_vcomp\LICENSE" dist\DNNL-LICENSE
IF %NAME%==cpu-dnnl 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip .\dist\DNNL-LICENSE
IF %OPENCL%==true type scripts\check_opencl.bat |more /P > dist\check_opencl.bat
IF %OPENCL%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip .\dist\check_opencl.bat
IF %DX%==true type scripts\check_dx.bat |more /P > dist\check_dx.bat
IF %DX%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip .\dist\check_dx.bat
IF %CUDA%==true copy "%CUDA_PATH%\EULA.txt" dist\CUDA.txt
IF %CUDA%==true copy "%PKG_FOLDER%\cuda\NVIDIA_SLA_cuDNN_Support.txt" dist\CUDNN.txt
IF %CUDA%==true type dist\README-cuda.txt |more /P > dist\README.txt
IF %CUDA%==true 7z a lc0-%APPVEYOR_REPO_TAG_NAME%-windows-%NAME%.zip .\dist\README.txt .\dist\CUDA.txt .\dist\CUDNN.txt
IF EXIST lc0-%APPVEYOR_REPO_TAG_NAME%-windows-gpu-dx12.zip ren lc0-%APPVEYOR_REPO_TAG_NAME%-windows-gpu-dx12.zip lc0-%APPVEYOR_REPO_TAG_NAME%-windows10-gpu-dx12.zip
