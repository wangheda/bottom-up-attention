
ln -s ../../ImageCaption-xqx/data/ai_challenger_caption_train_20170902/caption_train_images_20170902 data/aichallenger_train
ln -s ../../ImageCaption-xqx/data/ai_challenger_caption_validation_20170910/caption_validation_images_20170910 data/aichallenger_validate
ln -s ../../ImageCaption-xqx/data/ai_challenger_caption_test1_20170923/caption_test1_images_20170923 data/aichallenger_test

if [ ! -f aichallenger_train.tsv ]; then
  ./tools/generate_tsv_for_aichallenger.py --gpu 0 --cfg experiments/cfgs/faster_rcnn_end2end_resnet.yml --def models/vg/ResNet-101/faster_rcnn_end2end_final/test.prototxt --out aichallenger_train.tsv --net data/faster_rcnn_models/resnet101_faster_rcnn_final.caffemodel --split aichallenger_train
fi 

if [ ! -f aichallenger_validate.tsv ]; then
  ./tools/generate_tsv_for_aichallenger.py --gpu 0 --cfg experiments/cfgs/faster_rcnn_end2end_resnet.yml --def models/vg/ResNet-101/faster_rcnn_end2end_final/test.prototxt --out aichallenger_validate.tsv --net data/faster_rcnn_models/resnet101_faster_rcnn_final.caffemodel --split aichallenger_validate
fi 

if [ ! -f aichallenger_test.tsv ]; then
  ./tools/generate_tsv_for_aichallenger.py --gpu 0 --cfg experiments/cfgs/faster_rcnn_end2end_resnet.yml --def models/vg/ResNet-101/faster_rcnn_end2end_final/test.prototxt --out aichallenger_test.tsv --net data/faster_rcnn_models/resnet101_faster_rcnn_final.caffemodel --split aichallenger_test
fi 

