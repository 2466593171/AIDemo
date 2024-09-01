package org.example.fileControl.Factory.AIPictureFactory;

import org.example.fileControl.common.AiPictureConfig;

public class AIPictureFactory {


    public static PictureCilent getPictureCilent(String platform)
    {
        switch (platform)
            {
                case AiPictureConfig.ALLG_TYPE:
                default:
                    return new AllGCilent();
            }
    }
}
