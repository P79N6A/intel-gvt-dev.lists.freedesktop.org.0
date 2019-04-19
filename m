Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1546240ywo;
        Fri, 19 Apr 2019 01:39:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzysAtioqjbCMttYVuyrP80SoLYwLwvNJBNJtf6RJ7HLkZ7kcBpUC9+fQ++FGbBhiC2nmH/
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr2586069pls.100.1555663166684;
        Fri, 19 Apr 2019 01:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555663166; cv=none;
        d=google.com; s=arc-20160816;
        b=KqYsAChajQAzcrkLfENH2uxGhxWw8MElbxbgfxeo9VkK39FBF8g4pcXt2KwmrQGBz/
         QEEyS5p5gnxqLPDXXdu7K23oTNc/5M4WjcTqN0m8kWa6nzrqRLUt0axVc4mX+ygADfeO
         pdFz1kXkD0hEbpJp/TQlcSejM/xcyert9dadTnYQUFoe3PVrQ1fICdFKyNaXcxI5kCa7
         C03UXj4/w8JIhnRCP0DfxtlCpnEe8tksrCtGG2snKwhxq6+4mR2MA7T240irFzTt298m
         jQKkICBMwGmsxwUPRmybYBbIaKaxlCCUJ4KKjSQ04sof3SQjgx1NY2k/LFOg9TcjJoDD
         VUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=/PoHxB0tv7ZloSWNV8/uhLqbAOwZizq8nqd3jBy9LOk=;
        b=yVz7u3QsmLOvcbHDd4hwBLqU8wGr/ze8Blv3n8b2AsNfc7Faqm3aWcDTJvhKt4fmmR
         6RKh9ewCwcUNOCDsnTNW53GEtfvaegcCRSXz9TVBPvFmLt1svv6IXbQ3HxiicrJO6Q78
         rr5cc0/81vmxm0bN9YhayO0mQRuKw4eCdLocYNMk7NBYQgIucRJhJrCrT5/9avZao4kD
         qWzWeWXclvYAFf2T6mS4Gpd19DWywQHWnBobA59R0zsHvT2cm5dmRDMiNgSB2aNnJR33
         mK8bsyZ9WtC94m+Uiju78rmUrLBPyihFsF4M4cc2C2B9RzMmhRZUvT+0QQwdwTyuc7qQ
         8DPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 130si4174752pgc.256.2019.04.19.01.39.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2019 01:39:26 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0368920D;
	Fri, 19 Apr 2019 08:39:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508998920D
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 19 Apr 2019 08:39:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Apr 2019 01:39:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,368,1549958400"; d="scan'208";a="141935693"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 19 Apr 2019 01:39:19 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/2] introduction of version attribute for VFIO live migration
Date: Fri, 19 Apr 2019 04:32:58 -0400
Message-Id: <20190419083258.19580-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: cjia@nvidia.com, kvm@vger.kernel.org, aik@ozlabs.ru,
 Zhengxiao.zx@alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, kwankhede@nvidia.com, eauger@redhat.com,
 yi.l.liu@intel.com, eskultet@redhat.com, ziye.yang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, libvir-list@redhat.com,
 arei.gonglei@huawei.com, felipe@nutanix.com, Ken.Xue@amd.com,
 kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>, dgilbert@redhat.com,
 zhenyuw@linux.intel.com, alex.williamson@redhat.com, changpeng.liu@intel.com,
 cohuck@redhat.com, linux-kernel@vger.kernel.org, zhi.a.wang@intel.com,
 jonathan.davies@nutanix.com, shaopeng.he@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIGEgdmVyc2lvbiBhdHRyaWJ1dGUgdW5kZXIgc3lzZnMg
b2YgVkZJTyBNZWRpYXRlZApkZXZpY2VzLgoKVGhpcyB2ZXJzaW9uIGF0dHJpYnV0ZSBpcyB1c2Vk
IGJ5IHVzZXIgc3BhY2Ugc29mdHdhcmUgbGlrZSBsaWJ2aXJ0IHRvCmRldGVybWluZSB3aGV0aGVy
IHR3byBtZGV2IGRldmljZXMgYXJlIGNvbXBhdGlibGUgZm9yIGxpdmUgbWlncmF0aW9uCmJlZm9y
ZSBzdGFydGluZyBsaXZlIG1pZ3JhdGlvbi4KClBhdGNoIDEgZGVmaW5lcyB2ZXJzaW9uIGF0dHJp
YnV0ZSBhcyBtYW5kYXRvcnkgZm9yIFZGSU8gbGl2ZSBtaWdyYXRpb24uIEl0Cm1lYW5zIGlmIHZl
cnNpb24gYXR0cmlidXRlIGlzIG1pc3Npbmcgb3IgaXQgcmV0dXJucyBlcnJubywgdGhlCmNvcnJl
c3BvbmRpbmcgbWRldiBkZXZpY2UgaXMgcmVnYXJkZWQgYXMgbm90IHN1cHBvcnRpbmcgbGl2ZSBt
aWdyYXRpb24uCnNhbXBsZXMgZm9yIHZmaW8tbWRldiBhcmUgbW9kaWZpZWQgdG8gZGVtb25zdHJh
dGUgaXQuCgpQYXRjaCAyIHVzZXMgR1ZUIGFzIGFuIGV4YW1wbGUgdG8gc2hvdyBob3cgdG8gZXhw
b3NlIHZlcnNpb24gYXR0cmlidXRlIGFuZApjaGVjayBkZXZpY2UgY29tcGF0aWJpbGl0eSBpbiB2
ZW5kb3IgZHJpdmVyLgoKCllhbiBaaGFvICgyKToKICB2ZmlvL21kZXY6IGFkZCB2ZXJzaW9uIGZp
ZWxkIGFzIG1hbmRhdG9yeSBhdHRyaWJ1dGUgZm9yIG1kZXYgZGV2aWNlCiAgZHJtL2k5MTUvZ3Z0
OiBleHBvcnQgbWRldiBkZXZpY2UgdmVyc2lvbiB0byBzeXNmcyBmb3IgSW50ZWwgdkdQVQoKIERv
Y3VtZW50YXRpb24vdmZpby1tZWRpYXRlZC1kZXZpY2UudHh0ICAgIHwgMzYgKysrKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvTWFrZWZpbGUgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZGV2aWNlX3ZlcnNpb24uYyB8IDk0ICsrKysrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3Z0LmMgICAgICAgICAgICB8IDU1ICsr
KysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndnQuaCAgICAgICAgICAgIHwg
IDYgKysKIHNhbXBsZXMvdmZpby1tZGV2L21ib2Nocy5jICAgICAgICAgICAgICAgIHwgMTcgKysr
Kwogc2FtcGxlcy92ZmlvLW1kZXYvbWRweS5jICAgICAgICAgICAgICAgICAgfCAxNiArKysrCiBz
YW1wbGVzL3ZmaW8tbWRldi9tdHR5LmMgICAgICAgICAgICAgICAgICB8IDE2ICsrKysKIDggZmls
ZXMgY2hhbmdlZCwgMjQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGV2aWNlX3ZlcnNpb24uYwoKLS0gCjIu
MTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
