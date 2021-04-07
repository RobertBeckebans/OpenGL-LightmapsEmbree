REM cd ..
del /s /q build
mkdir build
cd build
cmake -G "Visual Studio 15 Win64" -DEMBREE_ISPC_SUPPORT=OFF -DEMBREE_TASKING_SYSTEM=INTERNAL -DOPENIMAGEIO_ROOT="E:\Projects\OpenGL-LightmapsEmbree\external\oidn-1.2.4.x64.vc14.windows" ..

pause