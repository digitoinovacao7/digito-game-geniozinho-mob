
import { Button } from "@/components/ui/button";
import { Smartphone, Play } from "lucide-react";

const DownloadButtons = () => {
  return (
    <div className="flex justify-center items-center">
      <a 
        href="https://play.google.com/store/apps/details?id=br.com.digitoinovacao.geniozinho&pcampaignid=web_share"
        target="_blank"
        rel="noopener noreferrer"
      >
        <Button className="bg-black hover:bg-gray-800 text-white font-poppins font-semibold px-6 py-3 rounded-xl hover-scale flex items-center space-x-3 min-w-[200px]">
          <Play className="w-6 h-6" />
          <div className="text-left">
            <div className="text-xs">Disponível no</div>
            <div className="text-sm font-bold">Google Play</div>
          </div>
        </Button>
      </a>
    </div>
  );
};

export default DownloadButtons;
