<addReadGroups.mk

addReadGroups:VE:
	./targets | xargs mk

results/grouped/%.grouped.bam:D:	data/%.bam
	mkdir -p `dirname $target`
	RGSM=`basename $target .bam`
	picard-tools AddOrReplaceReadGroups \
	            I=$prereq \
                        O=$target".build" \
                        RGID=$RGID \
                        RGLB=$RGLB \
                        RGPL=$RGPL \
                        RGPU=$RGPU \
                        RGSM=$RGSM \
	&& mv $target".build" $target