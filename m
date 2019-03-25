Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3279488ywb;
        Sun, 24 Mar 2019 23:20:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXQ2wa4gCVSCBOZQ5Qf4X9yzMKhxir9H26jSLtTJ7bTPq3GJGLurPwKrM02H1IVIu3avP2
X-Received: by 2002:a65:6283:: with SMTP id f3mr22250206pgv.108.1553494854117;
        Sun, 24 Mar 2019 23:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553494854; cv=none;
        d=google.com; s=arc-20160816;
        b=Ffw8IhJiCJyNxwfKUCM9/SQJQ4dJDnzL5LFnwhvo+lAnJh7updtgqFP12BbQZZRPqq
         DnjjeCAJn1xs48eEN6s88z8+jloFVb0w6+L6hlhG/PIf4fHUyYB5dZLHocZ3DgANe6X3
         H9HF2X5mYvXWb3p5gWMQ+9YqmuRXQPsV80RSPAdBrlZSMmw0u9H0nslHylHwgsgIrevL
         BQun69/XYQ1rMlH/ujngZl8iLqMVnS4jNdbPUuFMhyFF+T1sKuwnFKNlqpkRceOoq3Vv
         GGvEhIesTuH+R27Gwaa8uP0nY1P42MZaoKw/BdweVXAe+b4IW5ErwbIZ9CtiptzZ15ib
         BEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=uSxfeBjiVMyWAz517QnI442GooYLULJeaXM7fFRxKOU=;
        b=wLFqsxFy/NWY17s6JPbmPYiZU0bs0h84vx5pODsnPQZlC1Yhw/fI6u/TCppsjf1dlT
         bXIsa8STDeXShNjmTfXYd0KQC8t3hYDMXQZGuyFkDzwZbaFxyLetZSkWfIIKqNo9ysNI
         v7JOMWWHaELz+aorx7yE997CZ9wZXOD+8zjv76AgwRsoqg4IGOpk7TW03yzCAMfCFySy
         hUXNud0lht5KAbzHlG99gCdBvcL6VtW3uLD6jyP39WJ9CV+hVeLY/skSW7ZAGtmAehBV
         undQTw4wcnzH6h3EC30AmfOQwUiP1L+8pdOuu//i1pmFWmVi3YCy1s2TW1I83kilWJy/
         VCZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id w10si13188769plq.328.2019.03.24.23.20.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2019 23:20:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434606E643;
	Mon, 25 Mar 2019 06:20:53 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2966E643
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 06:20:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Mar 2019 23:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; d="scan'208";a="125587466"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga007.jf.intel.com with ESMTP; 24 Mar 2019 23:20:50 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: support MI_SEMAPHORE_WAIT
Date: Mon, 25 Mar 2019 02:15:14 -0400
Message-Id: <20190325061514.25338-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

aW4gbGludXggNS4wLCBpOTE1IGRyaXZlciBub3cgdXNlcyBNSV9TRU1BUEhPUkVfV0FJVCB0byBz
eW5jIHJlcXVlc3RzLgpHVlQtZyBzaG91bGQgYWRkIHN1cHBvcnQgZm9yIHRoaXMgY29tbWFuZCBu
b3cKClNpZ25lZC1vZmYtYnk6IFlhbiBaaGFvIDx5YW4ueS56aGFvQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIHwgMjUgKysrKysrKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9wYXJzZXIuYwppbmRleCBhMTZlNTI3ZTlmMDIu
LmU5OGYwYTBkMzA4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2NtZF9w
YXJzZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvY21kX3BhcnNlci5jCkBAIC0x
NTM4LDcgKzE1MzgsMzAgQEAgc3RhdGljIGludCBjbWRfaGFuZGxlcl9taV9zdG9yZV9kYXRhX2lt
bShzdHJ1Y3QgcGFyc2VyX2V4ZWNfc3RhdGUgKnMpCiAKIHN0YXRpYyBpbnQgY21kX2hhbmRsZXJf
bWlfc2VtYXBob3JlX3dhaXQoc3RydWN0IHBhcnNlcl9leGVjX3N0YXRlICpzKQogewotCXJldHVy
biB1bmV4cGVjdGVkX2NtZChzKTsKKwl1bnNpZ25lZCBsb25nIGdtYSwgZ21hX2hpZ2g7CisJaW50
IHJldCA9IDA7CisJaW50IGNtZF9sZW4gPSBjbWRfbGVuZ3RoKHMpOworCXN0cnVjdCBpbnRlbF92
Z3B1ICp2Z3B1ID0gcy0+dmdwdTsKKwlpbnQgZ21hX2xlbiA9IHNpemVvZih1MzIpOworCisJaWYg
KGNtZF9sZW4gIT0gNCAmJiBjbWRfbGVuICE9IDUpIHsKKwkJZ3Z0X3ZncHVfZXJyKCJJbGxlZ2Fs
IGNtZCBsZW5ndGggJWRcbiIsIGNtZF9sZW4pOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwkv
KiBwcGd0dCBpcyBhbHdheXMgc2FmZSAqLworCWlmICghKGNtZF92YWwocywgMCkgJiAoMSA8PCAy
MikpKQorCQlyZXR1cm4gcmV0OworCisJZ21hID0gY21kX3ZhbChzLCAyKSAmIEdFTk1BU0soMzEs
IDApOworCWlmIChjbWRfbGVuID09IDUpIHsKKwkJZ21hX2hpZ2ggPSBjbWRfdmFsKHMsIDMpICYg
R0VOTUFTSygzMSwgMCk7CisJCWdtYSA9IChnbWFfaGlnaCA8PCAzMikgfCBnbWE7CisJCWdtYV9s
ZW4gPSBzaXplb2YodTY0KTsKKwl9CisJcmV0ID0gY21kX2FkZHJlc3NfYXVkaXQocywgZ21hLCBn
bWFfbGVuLCBmYWxzZSk7CisJcmV0dXJuIHJldDsKKwogfQogCiBzdGF0aWMgaW50IGNtZF9oYW5k
bGVyX21pX3JlcG9ydF9wZXJmX2NvdW50KHN0cnVjdCBwYXJzZXJfZXhlY19zdGF0ZSAqcykKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRl
bC1ndnQtZGV2
