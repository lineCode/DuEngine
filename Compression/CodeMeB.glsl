// MtBfRR
highp ivec2 SV_DispatchThreadID = ivec2(0,0);
highp int Double_pixelID = 0;
highp vec4 col = vec4(0.,0.,0.,0.);
int i = 256;

//pass !
void A(uvec4 data){
    
    if(Double_pixelID == i++){
        if((SV_DispatchThreadID.x & 0x1) == 0){
        	col.xy = unpackUnorm2x16(data.s);
    		col.zw = unpackUnorm2x16(data.t);
        }
        else{
        	col.xy = unpackUnorm2x16(data.p);
    		col.zw = unpackUnorm2x16(data.q);
        }
    }
}

void mainImage( out vec4 C, in vec2 U)
{
    SV_DispatchThreadID = ivec2(floor(U-0.5));
    if(SV_DispatchThreadID.x >= 32 || SV_DispatchThreadID.y >= 32){
    	C = vec4(1./3.);
        //return;
    }
    if(iFrame > 2){
    	C = texture(iChannel1,U/iResolution.xy);
        //discard;
    }
    //1个像素存一个数据块
    //16 x 32, 16为其中2个像素存2个块数据
    //像素ID编号
    Double_pixelID = (SV_DispatchThreadID.x>>1) + (SV_DispatchThreadID.y<<4); 
    //--------------------------------------------------------------------------
	A(uvec4(0x41E74A07u,0x687068E0u,0x31A641E7u,0x585878F0u));
	A(uvec4(0x31A73A08u,0x2D2D2D0Bu,0x42295AEAu,0x2D2D2D2Du));
	A(uvec4(0x5B0A6B4Cu,0xB2FADADu,0x39A7634Cu,0x5870E0E0u));
	A(uvec4(0x3966CC50u,0x2DB5D555u,0x4986C470u,0xE0E07F55u));
	A(uvec4(0x61E87289u,0xA2B2DB5u,0x82CBA36Du,0x2D2DBDADu));
	A(uvec4(0xA38DC450u,0xB2DBDF5u,0xB40FD4D2u,0x22B2FBDu));
	A(uvec4(0xCC91DD75u,0xAABFFD5u,0xBC91DD55u,0xA86A5Fu));
	A(uvec4(0xB3CFD4F3u,0xDC56658Du,0x828AEDD6u,0x2AB5557u));
	A(uvec4(0x722AE595u,0xAAFD55u,0x7AABC4B2u,0xE8EEEDF5u));
	A(uvec4(0x6B0E83D0u,0x826A5FD5u,0x632F7B90u,0x2D2D2D2Bu));
	A(uvec4(0x82EDFE59u,0xBABAD55u,0x92CCF5F7u,0xAAFE55u));
	A(uvec4(0x92CBEE17u,0x2AFF55u,0xAB8EEE38u,0x2BD5u));
	A(uvec4(0xCCD3F658u,0x8080EA55u,0x7A8AE575u,0x565C5E5Fu));
	A(uvec4(0x59E86A4Au,0x5E5C5C5Cu,0x51C759E8u,0xA2AAAA80u));
	A(uvec4(0x49A759E8u,0xEAEAFAFAu,0x49A759E8u,0xFFFFFF7Fu));
	A(uvec4(0x49A751C8u,0x5EFF7777u,0x498649A7u,0xFEFEFAFFu));
	A(uvec4(0x41E74A07u,0x5E5E7A7Au,0x318639C7u,0x54DCF860u));
	A(uvec4(0x31A73A08u,0x2D2D2DBDu,0x42285ACAu,0x2D2D2D2Du));
	A(uvec4(0x4A69632Bu,0x42820202u,0x39666AAAu,0x2517D65Cu));
	A(uvec4(0x7269BC2Fu,0xEF353B29u,0x6A48C430u,0x5D575C78u));
	A(uvec4(0x6A2982EAu,0x35B5BDB5u,0x932CBC2Fu,0x92DADB5u));
	A(uvec4(0xB40FD4F2u,0x20A2FBDu,0xCCD2E595u,0xB2FBDD5u));
	A(uvec4(0xD534EDD6u,0x20A2FADu,0xE575EE17u,0x2AAAFA5Fu));
	A(uvec4(0xC451EDD6u,0x80E87A5Eu,0xD4D3EE17u,0x2F090B0Bu));
	A(uvec4(0xEE38DD95u,0x15959525u,0xABF0DD34u,0xEBF87878u));
	A(uvec4(0x734F9411u,0x5CA8828Bu,0x6B2F7BD1u,0x78A0A8B6u));
	A(uvec4(0x624AD597u,0x5757570Bu,0x6209F617u,0x5555AF00u));
	A(uvec4(0x51C8F618u,0x557F0000u,0x59C8FE79u,0x5555FA00u));
	A(uvec4(0x6A6AE5B6u,0x555555E0u,0x62297AABu,0x5F7A7A78u));
	A(uvec4(0x51E86229u,0xDFFEFEFEu,0x59E851E8u,0xAAA9959Au));
	A(uvec4(0x49C759E8u,0xFAEAEAEAu,0x49A851C7u,0xAAAAAAAAu));
	A(uvec4(0x498651C8u,0xEAAAAAEAu,0x51A74166u,0x2A2AAAAAu));
	A(uvec4(0x39C649E8u,0x7E7AFEFAu,0x39A62966u,0x2020101u));
	A(uvec4(0x29663A08u,0x2D2D2D2Bu,0x42285ACBu,0xAD2D2D2Du));
	A(uvec4(0x31655B0Bu,0x565E78E0u,0x41458B0Cu,0xEBAB292Du));
	A(uvec4(0x4966936Cu,0x555F7AE8u,0x498682EBu,0x555DFBF2u));
	A(uvec4(0x59E782EBu,0x35353535u,0xA38DCC90u,0x2D2D2D2Du));
	A(uvec4(0xD4B2D533u,0x352D2D2Du,0xDD54E5D6u,0x2D2DADBDu));
	A(uvec4(0xE5B6D4F3u,0x95252555u,0xB3EFD554u,0xF85E5700u));
	A(uvec4(0xBC0FEDF7u,0xD5B50D00u,0xE534EE17u,0xBD2A0000u));
	A(uvec4(0xC471EE17u,0x5AE8E0C0u,0x9B4DCCD3u,0xD7800002u));
	A(uvec4(0x62EDA410u,0x7E7C5C5Cu,0x5A6C5AEEu,0x7AFAAAA0u));
	A(uvec4(0x49C95A8Du,0x5E5C5C5Cu,0x49C87B0Cu,0x550DF555u));
	A(uvec4(0x49A8936Eu,0xF5E0FF55u,0x41675A09u,0x5EFEFCFEu));
	A(uvec4(0x49A8626Au,0x9090103u,0x5A296A6Au,0x7A7A7868u));
	A(uvec4(0x51E859E8u,0xF7D0B8B8u,0x51E859E8u,0xEAFFEAEAu));
	A(uvec4(0x51C849C7u,0xA9A9A9A5u,0x49A651C8u,0xEAAAAAAAu));
	A(uvec4(0x49A751A7u,0xFDFF777Eu,0x416649A7u,0x5AEAEAEAu));
	A(uvec4(0x318641E7u,0x6AE8E8A8u,0x294631A7u,0x55D52726u));
	A(uvec4(0x296631E8u,0x2D2F2F2Fu,0x29664A69u,0x6AEA8202u));
	A(uvec4(0x290441A7u,0x95959794u,0x39256A28u,0x55FFAA00u));
	A(uvec4(0x310549A6u,0x5557FCB8u,0x29044166u,0xD5BF2E00u));
	A(uvec4(0x418682CBu,0x9535252Du,0x934CC450u,0x2D0B0B0Bu));
	A(uvec4(0xC491D4D2u,0x90B0B0Bu,0xBC30DD34u,0xFAFE7AE0u));
	A(uvec4(0x92EBD4D3u,0x2A57EAu,0x7A8ACCF3u,0x8055FEu));
	A(uvec4(0x8ACBC493u,0x78FEF5AFu,0x8AECE575u,0x55F5AF02u));
	A(uvec4(0x7A8BD514u,0x5557D6F8u,0x6A6AA3AFu,0x57FFE0FAu));
	A(uvec4(0x6B4E72CBu,0xFC5E7E7Fu,0x5ACC6B4Eu,0x7A7CEA6Au));
	A(uvec4(0x41C85AACu,0x56565C5Cu,0x49C8628Bu,0x550DF555u));
	A(uvec4(0x41A7628Bu,0x5F00FE2Fu,0x418749E8u,0xBBDEF754u));
	A(uvec4(0x49C8626Au,0x1090109u,0x5A09626Au,0xE0E07878u));
	A(uvec4(0x51E85A09u,0xE8ECFCDEu,0x51C85A08u,0xEBEAFAFAu));
	A(uvec4(0x51C851E7u,0xBFBFFFBFu,0x49A651C8u,0xAAAAEAEAu));
	A(uvec4(0x49A751A8u,0x5F5F5F7Fu,0x41865187u,0xFEFEFE7Eu));
	A(uvec4(0x316539A6u,0x6040C080u,0x21452945u,0xE0E8F8B8u));
	A(uvec4(0x212529A7u,0xB2B0B0Bu,0x21243A09u,0x5E5A7260u));
	A(uvec4(0x18E33106u,0x5757FFBFu,0x20C43925u,0x55FDE2A0u));
	A(uvec4(0x290420C4u,0x82A9u,0x20C33125u,0xBFBFAF2Fu));
	A(uvec4(0x39456209u,0xB5B53535u,0x7249B40Fu,0xB52D0B0Bu));
	A(uvec4(0xBC30D4D2u,0xFDBF2B0Bu,0xCC91D513u,0xAD8B0AEAu));
	A(uvec4(0xCCB2D513u,0x7FAA022Bu,0x9B8ED513u,0x7AE88000u));
	A(uvec4(0x82ABBC51u,0xD5575870u,0x82CCBC30u,0xB2FADF5u));
	A(uvec4(0x7AABC491u,0x80E07A5Fu,0x728B8B4Du,0x5CB70D81u));
	A(uvec4(0x6B2D7B2Cu,0x575E5858u,0x5AEC6B2Du,0xDEDCF860u));
	A(uvec4(0x41E96ACCu,0xBCD656u,0x49E8D5F7u,0xBBF5555u));
	A(uvec4(0x4A2AEF3Cu,0x80825D55u,0x51E9A451u,0x7E785F55u));
	A(uvec4(0x6A8B5A0Au,0x55545854u,0x5A096AABu,0x7A7A7A7Eu));
	A(uvec4(0x51E85A09u,0xE2E070E0u,0x51C85A08u,0x7D7FFFEFu));
	A(uvec4(0x49E751C8u,0xEAEAEAA8u,0x49E851A7u,0xB2AAAAAu));
	A(uvec4(0x49A751A7u,0x7E5E7E56u,0x416649A7u,0xBEAAAAAAu));
	A(uvec4(0x294539A6u,0x606060E0u,0x29453186u,0xBD81ED55u));
	A(uvec4(0x294529A7u,0xAF2FAFADu,0x20E429A7u,0x57565C58u));
	A(uvec4(0x18A320E4u,0x2AAAAAAFu,0x18C320E4u,0xA8AAAAAAu));
	A(uvec4(0x18C328E4u,0x2AAAABBBu,0x28E43105u,0x2BBD9595u));
	A(uvec4(0x31254186u,0xBDAD2D2Du,0x4987828Au,0xD5D5B52Du));
	A(uvec4(0x7269BC30u,0x55BD0B02u,0xA38DD4D2u,0x352F0A02u));
	A(uvec4(0xC450E5D5u,0xAAB7FFFu,0x932CEDD6u,0xAAFF7Eu));
	A(uvec4(0x9B4EDD75u,0xAFD5u,0xBC10D513u,0xE0A0FFF5u));
	A(uvec4(0xBC30CCD3u,0xD7FFAF8Fu,0x624AB430u,0xA080E078u));
	A(uvec4(0x626A6B2Du,0x80F090Bu,0x630D6B4Eu,0xDF7E585Eu));
	A(uvec4(0x5A8B6B0Du,0x7060AAAAu,0x5A4A9C32u,0x5555552Bu));
	A(uvec4(0x72EDBD16u,0x55555570u,0x6AAB7B0Du,0x5772F2FAu));
	A(uvec4(0x628B72CCu,0x7E5E5EFEu,0x5A09628Bu,0x787A7878u));
	A(uvec4(0x51E85A29u,0xA00EB7Bu,0x51E8624Au,0xAAFA5755u));
	A(uvec4(0x49A75A29u,0xAAFFFFu,0x49A75A08u,0xA0FEFFFFu));
	A(uvec4(0x49A751E8u,0x7EDE5657u,0x416649A7u,0xEAE8FA7Au));
	A(uvec4(0x212439A6u,0x78E0A0E0u,0x212531A6u,0x55EB8AAFu));
	A(uvec4(0x212531A6u,0x5557EA82u,0x20C32105u,0xEAFE7E76u));
	A(uvec4(0x20E42904u,0xF5D5F555u,0x20E42904u,0xA0AAFF7u));
	A(uvec4(0x28E42925u,0x3FAABFD5u,0x31053166u,0xBFFFD555u));
	A(uvec4(0x39253966u,0x20BAFu,0x396649A7u,0x5FFFAD2Du));
	A(uvec4(0x416651C7u,0xD5F5AF00u,0x51E8BC0Fu,0xD5B52D0Bu));
	A(uvec4(0x82ABE574u,0x55F5AF0Au,0xABCFE574u,0xE9FFAA00u));
	A(uvec4(0xA3AEDD54u,0xD5AF0200u,0x8B2DCCB2u,0x56FEA880u));
	A(uvec4(0x830DC472u,0x55973F2Au,0x72ABAC10u,0x577CFCA8u));
	A(uvec4(0x62AB83D0u,0x2D2BBBFEu,0x632D8411u,0xE07A5F55u));
	A(uvec4(0x5AAB6B4Eu,0x7C7E7A7Au,0x524A62ACu,0x3E3EDF57u));
	A(uvec4(0x6ACC83AFu,0x575C7C7Du,0x628B72CCu,0x7FFEFEEAu));
	A(uvec4(0x628B6AABu,0x5F5EF8A0u,0x5A29628Bu,0xAAAAAA78u));
	A(uvec4(0x51E8624Au,0x2A078DFu,0x51E85A29u,0x5C350300u));
	A(uvec4(0x5A29624Au,0xF5F7FFFBu,0x5A085A29u,0xE0E8E8E8u));
	A(uvec4(0x51E85A29u,0xFAFAFA57u,0x49A75208u,0xA8A2FA55u));
	A(uvec4(0x21043186u,0x5C5C5878u,0x21242125u,0xBB3D2D02u));
	A(uvec4(0x21252966u,0x555F5F5Du,0x18E428E4u,0xABAFAFAFu));
	A(uvec4(0x20E42924u,0xFBFBBFB5u,0x20C32905u,0xEBABAAAAu));
	A(uvec4(0x28E42925u,0xADBFBA2Bu,0x29053966u,0xF5B5AD2Fu));
	A(uvec4(0x31453966u,0xABAA8A0Eu,0x31254187u,0xABAFAFBAu));
	A(uvec4(0x39654167u,0xEAEAEA2Au,0x396659E8u,0xFFBDBD2Fu));
	A(uvec4(0x49A76A6Au,0x55FFAB02u,0x59C8A3EFu,0xF5AD8B02u));
	A(uvec4(0x6A4AABCEu,0x55D7BF2Eu,0x6A4A9B8Eu,0xD5D7D6BCu));
	A(uvec4(0x622A7ACCu,0x7FFFAA00u,0x520A72ABu,0x5F7EF8A0u));
	A(uvec4(0x522A6B2Du,0xB5B5B50Du,0x5AAC7BAFu,0x7BFA2E02u));
	A(uvec4(0x5A6B738Fu,0x557F7878u,0x522A62ACu,0x9597979Fu));
	A(uvec4(0x6ACC6AABu,0xA5A5A5A5u,0x628A6AACu,0xFAFAFAEAu));
	A(uvec4(0x626A628Bu,0xFEFFFFA8u,0x5A4A6A6Au,0xFFFFFFFEu));
	A(uvec4(0x5A29624Au,0x7AFAEAAAu,0x51E8626Au,0xAAAAEA7Au));
	A(uvec4(0x49A75A29u,0xD8B42F0Bu,0x52085A09u,0x5DFEEA80u));
	A(uvec4(0x41A75A08u,0x7AAAA080u,0x41865208u,0xBF56E8A0u));
	A(uvec4(0x21043165u,0x7EFCF85Cu,0x21042965u,0xD2FABFFu));
	A(uvec4(0x21042965u,0xE0F07A7Eu,0x21042925u,0xFBF75555u));
	A(uvec4(0x20E42924u,0xFA7A7A7Au,0x20E42903u,0xF7FFFDFFu));
	A(uvec4(0x20E42904u,0xFFEF0F0Bu,0x29043126u,0xBDBDBDFDu));
	A(uvec4(0x31463966u,0xA3030B0Bu,0x396641A7u,0x7F6B89ADu));
	A(uvec4(0x396649C8u,0x29ADAFFFu,0x418749C8u,0xE3FDu));
	A(uvec4(0x498749E8u,0xAABFFFu,0x49C86A49u,0xFDF5B53Du));
	A(uvec4(0x5209624Au,0xFDABAA28u,0x5A0972ACu,0xD5D53737u));
	A(uvec4(0x5A2A6A6Au,0x7F7A7AF8u,0x52095A2Au,0xABEA6870u));
	A(uvec4(0x522A62ACu,0x95951535u,0x62AB6B0Du,0xF2E06050u));
	A(uvec4(0x524A6A8Cu,0x785E5757u,0x522A6ACDu,0x351595D5u));
	A(uvec4(0x6AAC730Cu,0x5EEAFA5Fu,0x628B72CCu,0xFFBAFE5Fu));
	A(uvec4(0x626A6A8Bu,0xA8B87E7Fu,0x6AAB624Au,0xA020000u));
	A(uvec4(0x5A49624Au,0xF8FAFA7Au,0x5A29626Au,0x7F7F7F5Fu));
	A(uvec4(0x49C75A29u,0x80808072u,0x41A75208u,0x26BE57EDu));
	A(uvec4(0x41A751E8u,0x80AAD55Fu,0x49C751E8u,0x82AAAA89u));
	A(uvec4(0x21042945u,0xBEACBCFCu,0x212531A6u,0x2FAFAFADu));
	A(uvec4(0x294531A6u,0xC0406272u,0x21253125u,0xAA2ABFFFu));
	A(uvec4(0x21043125u,0x7E7EFE7Fu,0x20E42925u,0xB5B5F5F5u));
	A(uvec4(0x20E43125u,0xBFFFDFDFu,0x29043146u,0xB7B7B5BDu));
	A(uvec4(0x31453967u,0xB5B5BDFFu,0x396641A7u,0xAF3FBFFBu));
	A(uvec4(0x396641A7u,0xD6FE2C02u,0x398649E8u,0xAD2F2A00u));
	A(uvec4(0x49C75209u,0x2F27B7BFu,0x52095A29u,0x556981ADu));
	A(uvec4(0x52095A29u,0xABBFD6D7u,0x51E85A4Au,0xC2C28BABu));
	A(uvec4(0x5209624Au,0xB5ADBFEAu,0x52295A4Bu,0xA0EAFFFDu));
	A(uvec4(0x522A628Bu,0xBAABBD95u,0x626B72CCu,0xE9AB8202u));
	A(uvec4(0x522A626Bu,0x80E07878u,0x520A6ACCu,0x27273535u));
	A(uvec4(0xACB372CCu,0x20902000u,0x624A730Cu,0xFC7CF5F5u));
	A(uvec4(0x51E88BCFu,0xE25BDFFFu,0x624A6AABu,0xC27D555Du));
	A(uvec4(0x49E85A29u,0x70E0000u,0x41A75A29u,0x70A00000u));
	A(uvec4(0x49C75A29u,0x7BEA8080u,0x41865208u,0xFD82030Au));
	A(uvec4(0x49C75208u,0xFDAAAAAAu,0x49C75208u,0xBAEAAAAu));
	A(uvec4(0x21052124u,0x5F5F57FEu,0x212631A6u,0xD5F5B52Fu));
	A(uvec4(0x29673186u,0xD5FDAA0Au,0x29463104u,0xF5BDAFAFu));
	A(uvec4(0x21042925u,0xFC7858F8u,0x21042905u,0xFDF5F5B5u));
	A(uvec4(0x20E43145u,0x2F2F2FBFu,0x29043986u,0xFAFAFEFFu));
	A(uvec4(0x29053966u,0xAFB73F3Fu,0x314641A7u,0xBDBDAF2Fu));
	A(uvec4(0x314641A7u,0xBEBEBEBEu,0x396649E8u,0xFFAFAFAFu));
	A(uvec4(0x41A751E9u,0x55D7FF8Bu,0x41A75209u,0xB5BFAAA2u));
	A(uvec4(0x49C85209u,0xFFFFEB00u,0x49E8522Au,0x29A90B82u));
	A(uvec4(0x52095A6Bu,0xBAFBDB5u,0x5A6A6AACu,0xEBFDFDD7u));
	A(uvec4(0x5A6A6ACCu,0x3FFF5F5Fu,0x628B838Fu,0x82AB7D5Du));
	A(uvec4(0x626B72ECu,0xDC767555u,0x5A2A72CCu,0xA0B0F27u));
	A(uvec4(0x6A8B72CCu,0x8080E058u,0x6A8B72ECu,0xFABEBFB5u));
	A(uvec4(0x5A298B8Eu,0xFFFFDFC2u,0x626A7B0Du,0x5F5F2A0Bu));
	A(uvec4(0x5A297B4Eu,0x7F555C56u,0x49C8624Au,0xE8EEBF5Au));
	A(uvec4(0x49C75A09u,0xFAFFAEFFu,0x41665209u,0xFAFADE57u));
	A(uvec4(0x416649E8u,0xBCB6AEBu,0x398651E8u,0x2F2F2D0Bu));
	A(uvec4(0x31A72125u,0x5555AA00u,0x21263A29u,0x2022FF5u));
	A(uvec4(0x31A8426Au,0x8280FA55u,0x29463A09u,0xF8787E5Fu));
	A(uvec4(0x21052966u,0xE8FE5757u,0x21042905u,0xAA0AABAFu));
	A(uvec4(0x29053166u,0xFDD59595u,0x29453966u,0xBDABAAF8u));
	A(uvec4(0x31263986u,0x22A0FADu,0x31663966u,0x2AAA8A82u));
	A(uvec4(0x396639A7u,0xA5ADADFDu,0x398741A7u,0x555555FFu));
	A(uvec4(0x398741C8u,0x929D5D5u,0x41A749E9u,0xFFFFBD2Du));
	A(uvec4(0x41C85209u,0xB5FFFFFFu,0x49E8522Au,0x2F2F2D29u));
	A(uvec4(0x522A626Bu,0xB0BABABu,0x5A8D628Bu,0xAAAA8A0u));
	A(uvec4(0x83AF62ACu,0xA0604080u,0x732D8BAFu,0xFBE0E0E2u));
	A(uvec4(0x626B7B2Du,0x60F8FCDCu,0x6AAC730Du,0x98DAD25u));
	A(uvec4(0x6ACC72EDu,0xFAEA7E7Cu,0x6AAB72EDu,0xFEFFFFFFu));
	A(uvec4(0x6AAB6AACu,0x555E7E56u,0x628A6AACu,0xFFFEFFFFu));
	A(uvec4(0x626A6A8Bu,0x565E5D57u,0x5A29624Au,0xAAA8AAFAu));
	A(uvec4(0x52085A49u,0x8080A878u,0x49E85A49u,0xAAAAFE57u));
	A(uvec4(0x49A75208u,0x8000E05Du,0x39665208u,0x2A2Du));
	A(uvec4(0x294631C7u,0x3D2B0A0Au,0x3A0931C8u,0x58585656u));
	A(uvec4(0x3A093A4Au,0xAD030202u,0x31C83A2Au,0xE078785Eu));
	A(uvec4(0x292531E8u,0x80EAFE7Fu,0x29252966u,0xF07A5F55u));
	A(uvec4(0x29253146u,0x2FAFAFABu,0x31463986u,0xFF755555u));
	A(uvec4(0x31463986u,0xFFFBAB0Bu,0x31663966u,0x7F5FFAA8u));
	A(uvec4(0x31653987u,0xAB2B2A2Au,0x39663987u,0x2A2E2A0Au));
	A(uvec4(0x396741C8u,0xB2F2F0Bu,0x41A849E8u,0x3FBFFFD7u));
	A(uvec4(0x41C85209u,0x2A2FADB5u,0x4A09626Bu,0xAB2F2DBDu));
	A(uvec4(0x5A4A628Cu,0xBFBFBFBFu,0x628C6B4Eu,0x35B55555u));
	A(uvec4(0x62CD738Fu,0xA0EAEBADu,0x6B0E734Du,0xD5D5B5ABu));
	A(uvec4(0x62CC72EDu,0xB72F0380u,0x72CC7B2Eu,0xAAA9ADEDu));
	A(uvec4(0x72EC730Du,0xF0F87A5Eu,0x6ACC72ECu,0xA8AAAAFEu));
	A(uvec4(0x6AAB72CCu,0x5E5E5E5Fu,0x626A6AABu,0xA8BCBCA8u));
	A(uvec4(0x62AB626Au,0x2020A02u,0x624A6269u,0xDDFFFFFFu));
	A(uvec4(0x5A29624Au,0x7A7A5E5Eu,0x52095A48u,0xFEFEFBFAu));
	A(uvec4(0x52085A2Au,0x7F7FFF7Fu,0x52085A09u,0xF5F7FF7Fu));
	A(uvec4(0x296631C7u,0x2BA9BD35u,0x31C74249u,0x2BA9FDFDu));
	A(uvec4(0x3A2952ECu,0xA2DF555u,0x426A532Du,0x80FA5D55u));
	A(uvec4(0x31E852CCu,0xADE5F57u,0x29464249u,0xF8F87E5Fu));
	A(uvec4(0x29863126u,0xFDFDABAAu,0x316639A7u,0xD5B5B5F5u));
	A(uvec4(0x31473986u,0x8AA8A8FAu,0x31663967u,0xBFBFFF7Fu));
	A(uvec4(0x31663987u,0x82ABBFAFu,0x398741C8u,0xB5D5D555u));
	A(uvec4(0x398749E9u,0x2B0BABAFu,0x49A84A09u,0xA2AAFu));
	A(uvec4(0x4A095A2Au,0xB2BBDFDu,0x522A628Cu,0x2BAFF5F5u));
	A(uvec4(0x5A6B6B2Eu,0x2FBFF5D5u,0x62AC7BAFu,0x20BADu));
	A(uvec4(0x6B6E83D0u,0xAAEAFEFFu,0x6B0E734Fu,0xA0FE5ED6u));
	A(uvec4(0x62AC734Fu,0xF8F0F8DEu,0x6AED836Fu,0xABA9E9EDu));
	A(uvec4(0x730D7B4Eu,0xA8FAFE5Fu,0x72CC730Du,0x80E0F85Eu));
	A(uvec4(0x6AAB7B0Du,0xFAFFFFFFu,0x628B72ECu,0xFAFEF757u));
	A(uvec4(0x626A62ABu,0xE8F0FAFEu,0x6249626Au,0x80A0E8E0u));
	A(uvec4(0x5A29626Au,0xF2E0EA6Bu,0x52096269u,0xFEFEFEFFu));
	A(uvec4(0x52085A2Au,0xFFEBFFFFu,0x522A51E7u,0xAAAAAAAAu));
	A(uvec4(0x31A64229u,0x2A2BBFB5u,0x42294AABu,0xB2FADB5u));
	A(uvec4(0x428B530Cu,0xA2BAFAFu,0x4AEC636Eu,0xB2B2BEBu));
	A(uvec4(0x530D638Eu,0x8080E049u,0x31C75B2Du,0xF8F8785Eu));
	A(uvec4(0x52AB31A7u,0x9020000u,0x316639A8u,0xAAFFFF55u));
	A(uvec4(0x316639A7u,0x80E2ABu,0x316639A7u,0x2AFAFBFu));
	A(uvec4(0x398741E8u,0x2BBD5555u,0x39A749E9u,0xAAAFFF5u));
	A(uvec4(0x41C8522Au,0x2BAFBDF5u,0x4A095A4Au,0xA2BAFF5u));
	A(uvec4(0x5A4A62ACu,0xBAFF555u,0x5A6B6AEDu,0x2AABFFD5u));
	A(uvec4(0x62EC83F1u,0x30BA9B5u,0x7B8F8411u,0x2ABFDu));
	A(uvec4(0x7BB09473u,0x82EB5F55u,0x732F83D1u,0xE0F85E5Eu));
	A(uvec4(0x6B0D7B6Fu,0xF8F8FA7Bu,0x7B2E838Fu,0x223A9EDu));
	A(uvec4(0x7B2E838Eu,0xA8E8FA5Eu,0x7B2D7B4Eu,0xE07A5E5Fu));
	A(uvec4(0x72EC7B2Du,0xE07A7E5Fu,0x6AAB72ECu,0xE0FA7A7Au));
	A(uvec4(0x62AB72CCu,0x5E575757u,0x626A62ABu,0xAAEAFA7Fu));
	A(uvec4(0x6249626Au,0x808080C0u,0x5A29626Au,0xFAFAFE5Fu));
	A(uvec4(0x52295A29u,0xA0A0F8F8u,0x52085A29u,0xEA6A7A57u));
	A(uvec4(0x39E74248u,0xB0B0B09u,0x426952CBu,0x2F2FBDBDu));
	A(uvec4(0x4ACB634Cu,0xBAFBDBDu,0x5B4D6BCEu,0x2A2BADADu));
	A(uvec4(0x638D73EFu,0xBBAAABDFu,0x4A8B6BAEu,0xA0A8F85Eu));
	A(uvec4(0x42295B2Du,0xE07058u,0x39C84A6Au,0x887A5F55u));
	A(uvec4(0x39A741E8u,0xA8DE5755u,0x39A741E8u,0xA020AB7u));
	A(uvec4(0x41C84A4Au,0xBADBFF5u,0x49E9526Bu,0x80EAFFD5u));
	A(uvec4(0x522A628Bu,0x2FADF5F5u,0x5A4A6AEDu,0xBAFADFDu));
	A(uvec4(0x628C732Eu,0xA2BADB5u,0x6AED7BAFu,0x2ABFBFD5u));
	A(uvec4(0x7B8F8C32u,0xA0B29A9u,0x8C329473u,0x283A3F55u));
	A(uvec4(0x94539CB5u,0xE260607Bu,0x7B908C12u,0x58787878u));
	A(uvec4(0x732E7B4Fu,0x300898u,0x838F8BB0u,0x82ABFBu));
	A(uvec4(0x836E8B90u,0xAAAEFE57u,0x7B2D836Fu,0xA0E0E8FAu));
	A(uvec4(0x7B2D834Eu,0xF8565755u,0x72CC7B2Du,0x5E5E5657u));
	A(uvec4(0x62AB72CCu,0xFAFAFE7Eu,0x628B6ACBu,0x7F7FFFD5u));
	A(uvec4(0x626A628Bu,0x7A7A785Eu,0x5A49626Bu,0xAAFEFFFFu));
	A(uvec4(0x5229624Au,0xAAEAEAFEu,0x52085A4Au,0xAAEAEAFEu));
    //--------------------------------------------------------------------------
	C = col + texelFetch(iChannel0,SV_DispatchThreadID,0);
    
}