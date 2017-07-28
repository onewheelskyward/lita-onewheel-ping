require 'cgi'
require 'uri'

require 'lita'

module Lita
  module Handlers
    class OnewheelPing < Handler
      route(/^ping$/i, :ping, help: {
        "ping" => "PONG"
      })
#      route(/fix.it/i, :fixit)

      # route(/ong$/i, :pong)

      def fixit(response)
        response.reply 'https://www.youtube.com/watch?v=pFRFRwkDsog'
      end

      def ping(response)
        pong_images = %w( 
          http://i.imgur.com/cRgZZca.gif
          https://dl.dropboxusercontent.com/u/575564/apecgnU.gif
          http://i.imgur.com/1LG3p1Q.gif
          http://cdn.memegenerator.net/instances/500x/43965451.jpg
          https://media.giphy.com/media/Us2YBZNhO8Pba/giphy.gif
          http://media.giphy.com/media/2WhCMpG85VhWE/giphy.gif
          http://media.giphy.com/media/rUCzODGkQF8GY/giphy.gif
          http://i.imgur.com/SbW8sEh.gif
          http://i.imgur.com/YTC0CEK.gif
          http://swng.it/uYr6s.gif
          http://25.media.tumblr.com/fa6c3e51a6464e202c351c607a4ea7b9/tumblr_mqpg9st8K71snfsquo1_400.gif
          http://i.imgur.com/b0GVMNz.gif
          http://www.doggifpage.com/gifs/109.gif
          http://i.imgur.com/aVn5ABf.gif
          http://swng.it/14ZqYT.gif
          http://i.imgur.com/2PjC7RX.gif
          http://i.imgur.com/82FbFvi.gif
          https://dl.dropboxusercontent.com/u/575564/tumblr_mppsh4IaB81snfsquo1_400.gif
          http://0.media.collegehumor.cvcdn.com/80/11/a5514aa0d1ad89720722b4fc12a9fe12.gif
          http://media1.break.com/dnet/media/2013/3/29/3d7c8a6a-e7df-41f0-9526-038224f4baa5.gif
          http://i.imgur.com/UaNm6fv.gif
          http://i.imgur.com/RgTu8yb.gif
          https://github-camo.global.ssl.fastly.net/4ba69a537791f9b79584abccf4b6a925d397acbc/687474703a2f2f6d656469612e67697068792e636f6d2f6d656469612f575257396463645933663839572f67697068792e676966#.png
          https://i.chzbgr.com/maxW500/1087527680/h0403FA19.jpg
          http://www.stupid.com/assets/images/JRCC_1.jpg
          https://lh6.googleusercontent.com/-KaoDXtxBeBw/UvTxrt7hZqI/AAAAAAAAph4/_fTAcb_9lRI/w280-h154-no/EvolutionDoor.gif
          http://i.imgur.com/tJKlWOL.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/u.s.-open-bird-man-videobombs-costas.gif
          https://f.cloud.github.com/assets/937626/2140770/b384be2c-9350-11e3-83e0-374c2b646829.jpg
          http://i.imgur.com/JTW4cle.jpg
          http://www.totalprosports.com/wp-content/uploads/2012/12/sports-reporter-almost-run-over-by-car.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/jay-onrait-jazz-hands-gif.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/towel-thrown-on-courtside-reporters-head.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/reporter-hit-in-head-with-soccer-ball.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/ian-hit-with-football.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/shaq-attacking-pinata-1.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/shaq-attacking-pinata-2.gif
          http://www.totalprosports.com/wp-content/uploads/2012/12/Jessica-Kastrop-Hit-in-the-Head-with-Soccer-Ball.gif
          http://blog.evaria.com/wp-content/uploads/2008/02/nuns-with-legs.jpg
          http://i.imgur.com/EXHo2Ag.gif
          https://f.cloud.github.com/assets/2894119/2172154/45e89dca-958f-11e3-86a0-63c60967148f.gif
          http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2011/10/Blinky-e1319824451193.jpg
          http://i.imgur.com/v1TyHu8.jpg
          http://31.media.tumblr.com/tumblr_lgq7ygJyck1qdgq6go1_250.gif
          http://i.imgur.com/eVlTtRy.gif
          http://i.imgur.com/civQQne.gif
          https://i.chzbgr.com/maxW500/8068878848/h0B8447D2/
          http://i.imgur.com/aleMzyT.gif
          http://weknowmemes.com/wp-content/uploads/2012/06/i-dont-always-poo-holy-shit.jpg
          http://i.imgur.com/tQBVFkV.gif
          http://pbs.twimg.com/media/BhQkaF4CcAADpxY.jpg
          http://i.imgur.com/JMXus92.gif
          http://cl.ly/image/1P372A1U4316/dkwyjs.gif
          http://i.imgur.com/h3N15C2.gif
          http://i.imgur.com/0uDd2Z5.gif
          http://kontraband.se/blog/wp-content/uploads/2009/08/st1.gif
          http://pauloliverfpblog.files.wordpress.com/2013/05/banging-head.gif
          https://lh3.googleusercontent.com/-ZRuuQPYHm4s/Uw4Euht_IQI/AAAAAAAAiig/LNMIBDyvVXY/w421-h288-no/Man+disguised+as+a+speed+camera+flashes+as+cars+drive+by+%2528medias.omgif.net%2529.gif
          http://i.imgur.com/AzS1hgd.gif
          http://www.doggifpage.com/gifs/116.gif
          https://dl.dropboxusercontent.com/u/12492300/excited_brad_pitt.gif
          http://24.media.tumblr.com/dc361833d0a5ddb4bc8f14c5f76719f8/tumblr_n1wme9Ziti1qdlh1io1_400.gif
          http://i.imgur.com/SIngIEm.jpg
          http://i.imgur.com/mIeNbA2.gif
          http://i.imgur.com/JSaqC5H.gif
          http://meme.loqi.me/4VEGnnN4.gif
          http://i.imgur.com/R7tEQPA.gif
          http://i.imgur.com/L2ASIya.gif
          https://s3.amazonaws.com/uploads.hipchat.com/81832/599114/KAnjyhhsb1DacFp/moto-twist.gif
          http://i.imgur.com/ZIbuNJE.gif
          https://dl.dropboxusercontent.com/u/12492300/no-no-no.gif
          http://s3-ec.buzzfed.com/static/enhanced/terminal05/2012/6/27/15/anigif_enhanced-buzz-31051-1340824765-10.gif
          http://static.fjcdn.com/pictures/Srsly_530ff6_429093.jpg
          https://31.media.tumblr.com/ba0ece39a50141b81431a1d1f7f930b5/tumblr_n3t0x55yDi1rs41dlo1_250.gif
          http://cl.ly/image/1x3e2S1k423H/PEH2j2j.gif
          http://i.imgur.com/4l4px0l.gif
          http://s1.cdn.autoevolution.com/images/news/yes-this-is-a-caterpillar-797-carried-by-a-mercedes-benz-actros-80513_1.jpg
          https://dl.dropboxusercontent.com/u/575564/um.gif
          https://i.chzbgr.com/maxW500/8175176960/h4DD8E7B8/.jpg
          http://i.imgur.com/fqhoT64.gif
          http://i.imgur.com/lKvEFKo.gif
          http://www.toychute.com/ProductImages/10300.jpg
          http://i.imgur.com/DlHoaXBl.jpg
          https://i.imgur.com/X17puIB.gif
          http://i.imgur.com/9betuST.gif
          http://i.imgur.com/zyPiTOc.gif
          http://i.imgur.com/qmPKJHh.gif
          http://2.bp.blogspot.com/-0F5h8vZhZeM/T7a8ny5ZlAI/AAAAAAAAD-w/2nSM6yOQ30Q/s640/tumblr_m3r4nej4d91qf5do9o1_500.gif
          http://giant.gfycat.com/InbornGrandioseAfricanporcupine.gif
          http://37.media.tumblr.com/b677b6b70be6235fbfe8797d6ce59734/tumblr_n6euc1ZIIw1txy0q2o1_400.gif
          http://i.imgur.com/s6bjPGC.gif
          http://i.hizliresim.com/wvPaVv.jpg
          http://s.mlkshk.com/r/104ZM.gif
          http://i.imgur.com/h6YTosu.gif
          http://i.imgur.com/8BcPh2d.gif
          http://i.imgur.com/tVjLxnv.gif
          http://i.imgur.com/2DmKoaq.gif
          http://i.imgur.com/PBhpWe7.jpg
          http://media.tumblr.com/76164aff91b34c5c96893a951118be50/tumblr_inline_nbk74zpzIc1syjnre.gif
          http://cdn.gifbay.com/2012/11/nap_time-12556.gif
          http://www.tehcute.com/pics/201109/baby-sloth-is-content-big.jpg
          https://s3.amazonaws.com/uploads.hipchat.com/81832/606728/w8Ttqi2tokoln3N/DanceChewbacca-1-1.gif
          http://i.imgur.com/5EFJrLx.gif
          http://www.argudo.org/~jpargudo/elephant_deal_scale30.png
	  http://i.giphy.com/xaNKhJNyVYylO.gif
	  https://s3.amazonaws.com/uploads.hipchat.com/81832/802537/W5eCbKps6O51EdR/train4.gif
	  http://img4.wikia.nocookie.net/__cb20080221152750/uncyclopedia/images/archive/8/84/20080221152925!332253819lsf1.jpg
	  https://cloud.githubusercontent.com/assets/17722/5541169/2823d6ac-8a89-11e4-86be-2db64cbcb344.gif
	  http://i.imgur.com/TDZVASd.gif
	  http://i.imgur.com/52Okqrs.gif
	  http://i.imgur.com/uSvfhtn.gif
	  https://pbs.twimg.com/media/B8DK6NVCMAE6HDB.jpg
	  http://i.kinja-img.com/gawker-media/image/upload/s--R3Bd1WpW--/c_fit,fl_progressive,q_80,w_636/ebuforyktsypedn4w0to.gif
	  http://4.bp.blogspot.com/-7v7gOaJvQzU/USTfR_MMi0I/AAAAAAAAAPQ/L9bW6nl51D0/s1600/1350490360_guy_jumps_cannon_ball_into_frozen_pond.gif
	  https://cloud.githubusercontent.com/assets/200357/6088553/96662aec-ae0c-11e4-81f2-9a908a0c88fc.gif
	  http://i.imgur.com/BY06jWm.gif
	  http://i.imgur.com/3d0f7u4.gif
	  http://i.picasion.com/pic63/65844fd04b525e139ad0ce79f795d6ed.gif
	  http://media.giphy.com/media/j3xC30PDz2QxO/giphy.gif
	  https://www.youtube.com/watch?v=h0O7biX22SE
	  http://38.media.tumblr.com/e0fdc4dd49b0b2c1398a7fa39399cdbe/tumblr_mt0vshE6LX1rta30ko1_250.gif
	  http://i.kinja-img.com/gawker-media/image/upload/s--WpkD8yDA--/1329190370893184943.gif
	  http://giphy.com/gifs/cat-space-star-trek-8AzK0d9yDuU0w
	  https://i.imgur.com/NMNqH.gif
	  http://i.imgur.com/7qnvE2B.gifv
	  http://media.giphy.com/media/v0Ii1yrFFSDEQ/giphy.gif
	  http://33.media.tumblr.com/c84906d22a3e8d5868440b77ed0ee3dd/tumblr_nstpo7ZfOP1s2yegdo1_400.gif
	  http://i.imgur.com/9fUu0.gif
	  https://img.washingtonpost.com/blogs/wonkblog/files/2015/08/7hAJ4qG1.gif
	  https://18f.gsa.gov/assets/blog/cloud-gov/ship-launch.gif
	  http://i.imgur.com/4N7S30H.gifv
	  http://i.imgur.com/GZcsgbG.gifv
	  http://i.imgur.com/CScmqnj.gif
	  http://i.imgur.com/o1ByMrG.gif
	  http://33.media.tumblr.com/64a238fc39c8ee1d313e40ffa48cda10/tumblr_npo9gzHbBj1s2yegdo1_400.gif
	  http://media.riffsy.com/images/5f514dd1e4c6f45b33d3bf18d063757e/raw
	  http://i.imgur.com/6gU3gD7.gifv
	  https://s-media-cache-ak0.pinimg.com/originals/e9/a6/c7/e9a6c7e4f1b3276e89fe6185f6cae0cf.jpg
	  https://media.giphy.com/media/12EkJCbpa3hGKc/giphy.gif
	  http://i.imgur.com/aOTo3Zr.gifv
	  http://i.imgur.com/nUokjAv.gifv
	  https://media.giphy.com/media/g5PgP4sr09vd6/giphy.gif
	  https://media.giphy.com/media/3o6Zt97pD7Tx3uSJA4/giphy.gif
          https://media3.giphy.com/media/ce1x5VblkD69i/giphy.gif
          http://i.stack.imgur.com/jiFfM.jpg
          http://meme.loqi.me/m/4kNkk_TY.jpg
          https://i.imgur.com/wYahuwm.gifv
          http://i.imgur.com/MHs4rsa.gifv
          https://media2.giphy.com/media/wg4y5TWOFXN3a/giphy.gif
          http://i.imgur.com/7ny7I32.gifv
          http://i.imgur.com/FA4rsxr.gif
          )

        if response.user.name == 'incanus77'  # Hi, Justin!
          pong = %w(
                 http://i.imgur.com/JTW4cle.jpg
                 https://f.cloud.github.com/assets/5572214/2140070/38283e06-9347-11e3-85a8-78b30b2f5701.JPG
                 https://f.cloud.github.com/assets/32314/2140406/00e89698-934c-11e3-9235-a8feb82e77fc.png
                 https://f.cloud.github.com/assets/937626/2140770/b384be2c-9350-11e3-83e0-374c2b646829.jpg
                 https://f.cloud.github.com/assets/26278/2140782/cd459340-9350-11e3-87a2-90fa8bf85872.jpg
                 http://i.imgur.com/cGDUG1B.jpg
                 https://f.cloud.github.com/assets/17722/2141926/8143e812-935e-11e3-9188-e48035860036.jpg
                 https://s3.amazonaws.com/uploads.hipchat.com/81832/590730/MgmFHcYSCMWqfGm/john.jpg
                 http://pythong.org/hasselhoffian-recursion.gif
          ).sample
        else
          pong = pong_images.sample
        end
        x = response.reply pong
        Lita.logger.debug x
      end

      def pong(response) # BOTFIGHT ON
        pingers = %w(abhorring
zoografting
)
        if response.user.name.eql?('zrobo') and response.message.source.room.eql?('#pdxbots')
          Lita.logger.info("Sending reply.")
          sleep(5 + rand(6))
          response.reply pingers.sample
        end
      end
    end
    Lita.register_handler(OnewheelPing)
  end
end
