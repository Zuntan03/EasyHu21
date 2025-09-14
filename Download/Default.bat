@echo off
chcp 65001 > NUL
@REM set EASY_TOOLS=%~dp0..\EasyTools

@REM call %EASY_TOOLS%\Civitai\Civitai_ApiKey.bat
@REM if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0diffusion_models\Hu21\HunyuanImage21_distilled-Cc-Q4_K_M.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_distilled-Cc-IQ4_NL.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_distilled-Qs-Q4_K_M.bat

@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_Lite-Cc-IQ4_NL.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_Lite-Cc-MXFP4_MOE.bat

call %~dp0diffusion_models\Hu21\HunyuanImage21_Refiner-Cc-Q4_K_M.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_Refiner-Cc-MXFP4_MOE.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_Refiner-Cc-IQ4_NL.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21_Refiner-Qs-Q4_K_M.bat

@REM call %~dp0diffusion_models\Hu21\HunyuanImage21-Cc-Q4_K_M.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21-Cc-IQ4_NL.bat
@REM call %~dp0diffusion_models\Hu21\HunyuanImage21-Qs-Q4_K_M.bat

@REM call %~dp0text_encoders\ByT5Small_GlyphSdxl2-fp16.bat
@REM call %~dp0text_encoders\ByT5Small_GlyphSdxl2-fp32-Cc-IQ4_NL.bat
call %~dp0text_encoders\ByT5Small_GlyphSdxl2-fp32-Cc-F16.bat

@REM call %~dp0text_encoders\Misaka27260\Qwen25VL-7B-Instruct-Abliterated-Mk-Q4_K_M.bat
@REM call %~dp0text_encoders\mradermacher\Qwen25VL-7B-Instruct-Abliterated-Mm-Q4_K_M.bat
@REM call %~dp0text_encoders\Mungert\Qwen25VL-7B-Instruct-Mg-Q4_K_M.bat
call %~dp0text_encoders\unsloth\Qwen25VL-7B-Instruct-UD-Us-Q4_K_XL.bat
@REM call %~dp0text_encoders\unsloth\Qwen25VL-7B-Instruct-Us-Q4_K_M.bat
@REM call %~dp0text_encoders\Qwen25VL-7B-Cc-Q4_0.bat
@REM call %~dp0text_encoders\Qwen25VL-7B-fp8_scaled.bat

call %~dp0vae\HunyuanImageVae-fp16.bat
call %~dp0vae\HunyuanImageRefinerVae-fp16.bat
@REM call %~dp0vae\Pig_HunyuanImageVae-fp32-Cc-F16.bat
@REM call %~dp0vae\Pig_HunyuanImageRefinerVae-fp32-Cc-F16.bat

@REM call %~dp0upscale_models\4x-UltraSharpV2.bat

@REM call %~dp0ultralytics\segm\99coins_anime_girl_face_m_seg.bat
@REM call %~dp0ultralytics\segm\AnimeNsfwDetectionAll_v4.bat
@REM call %~dp0ultralytics\segm\AnzhcBreasts-v1-1024-seg.bat
@REM call %~dp0ultralytics\segm\AnzhcEyes-seg.bat
@REM call %~dp0ultralytics\segm\AnzhcFace-v3-640-seg.bat
@REM call %~dp0ultralytics\segm\AnzhcHeadHair-seg.bat
@REM call %~dp0ultralytics\segm\nipples_v2_yolov11s-seg.bat
@REM call %~dp0ultralytics\segm\PitEyeDetailer-v2-seg.bat
@REM call %~dp0ultralytics\segm\PitHandDetailer-v2-Test-v9c.bat

