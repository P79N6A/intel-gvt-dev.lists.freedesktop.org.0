Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp5309324ywo;
        Tue, 9 Apr 2019 21:12:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+Q+gTnw2/bBqxU8eKRkOrtct1QCzglUBzGssqQZGqHNDNYVoZOq8oaRg7kwiU3NSSEEJ6
X-Received: by 2002:a63:2c3:: with SMTP id 186mr37756906pgc.161.1554869579073;
        Tue, 09 Apr 2019 21:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554869579; cv=none;
        d=google.com; s=arc-20160816;
        b=OI/ouJBe18iePIQb3/s4HvrMOYb0lBKHWnxFIBGkbCHLAwls4A6xTCdk2BL9Li2u04
         rZ+j083UrUncI9iJPuLQ13LxcEHPR8IRry3eIate3z7Lbpf4uBoZsDkEW/bzgY9QmjXa
         EfLJV7gXGO3Gp4qR4tcxlPYPa3VMrpCROoiIok2Gr6iLWgAkkSofrDuF3ap4lK0/Llax
         jaSs1yYAoViPtIUJ9VX3YpAxVwVR3JI96wcfSug9xo6xKzmP0ozZxZcOGRq+cV6d5Iiy
         69iETnqclKDlasCuKv0GXJ0Z0d/cNoeHJT/mA8Ga8631HCrG4uy7EIzzt9KHfWqcIuwQ
         OETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=xnHAe0VbwMWaglBM5/mISj5r1ecfy91AQEFolUbhHVQ=;
        b=phrPjKwQY/+uPQYv9Uo4Kp7PKB7LY0ymD9rnvXNFDhzwTTaI7/4WQQzqx/vKu7JonL
         fGHP9QXfJl32LJ2ciRubnbmAGVWNUb7T4vlS29Pbs90BR4ETSDdpbui/pXzhYz+QALeE
         nmMsSCc70cY2ah32yLym2IGztzJ91JiR3oYGaUVLOjLs6ECILa60HFD4Ax/CV+4wYwuO
         Rq2aEXbWfsj0Yy7AJcafe3c7rwYT1ITXlqRYp37LZ9M6UkPr2OP9FEI92PT9WyHYbbF8
         x8cd+Uy1ljG+MIe9CnyE8m4nRU7PHzfXFwPU31hOybuSysnIaAUoKPo4NwOO1Y2QltPU
         lH7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id z23si31574290plo.40.2019.04.09.21.12.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 21:12:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A4889292;
	Wed, 10 Apr 2019 04:12:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D1689292
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 10 Apr 2019 04:12:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Apr 2019 21:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; d="scan'208";a="162930705"
Received: from test-optiplex-7040.bj.intel.com ([10.238.154.166])
 by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2019 21:12:56 -0700
From: Xiong Zhang <xiong.y.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: Roundup fb->height into tile's height at
 calucation fb->size
Date: Wed, 10 Apr 2019 12:16:33 +0800
Message-Id: <1554869794-5196-1-git-send-email-xiong.y.zhang@intel.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Xiong Zhang <xiong.y.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

V2hlbiBmYiBpcyB0aWxlZCBhbmQgZmItPmhlaWdodCBpc24ndCB0aGUgbXVsdGlwbGUgb2YgdGls
ZSdzIGhlaWdodCwKdGhlIGZvcm1hdCBmYi0+c2l6ZSA9IGZiLT5zdHJpZGUgKiBmYi0+aGVpZ2h0
LCB3aWxsIGdldCBhIHNtYWxsZXIgc2l6ZQp0aGFuIHRoZSBhY3R1YWwgc2l6ZS4gQXMgdGhlIG1l
bW9yeSBoZWlnaHQgb2YgdGlsZWQgZmIgc2hvdWxkIGJlIG11bHRpcGxlCm9mIHRpbGUncyBoZWln
aHQuCgpGaXhlczogN2YxYTkzYjFmMWQxKCJkcm0vaTkxNS9ndnQ6IENvcnJlY3QgdGhlIGNhbGN1
bGF0aW9uIG9mIHBsYW5lIHNpemUiKQoKU2lnbmVkLW9mZi1ieTogWGlvbmcgWmhhbmcgPHhpb25n
LnkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYu
YyB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYwppbmRleCBmNmJlOTcxLi40ZTFlNDI1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC0yMDksNyArMjA5LDcgQEAgc3RhdGlj
IGludCB2Z3B1X2dldF9wbGFuZV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShkZXYpOwogCXN0cnVjdCBpbnRl
bF92Z3B1X3ByaW1hcnlfcGxhbmVfZm9ybWF0IHA7CiAJc3RydWN0IGludGVsX3ZncHVfY3Vyc29y
X3BsYW5lX2Zvcm1hdCBjOwotCWludCByZXQ7CisJaW50IHJldCwgdGlsZV9oZWlnaHQgPSAxOwog
CiAJaWYgKHBsYW5lX2lkID09IERSTV9QTEFORV9UWVBFX1BSSU1BUlkpIHsKIAkJcmV0ID0gaW50
ZWxfdmdwdV9kZWNvZGVfcHJpbWFyeV9wbGFuZSh2Z3B1LCAmcCk7CkBAIC0yMjgsMTIgKzIyOCwx
NSBAQCBzdGF0aWMgaW50IHZncHVfZ2V0X3BsYW5lX2luZm8oc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAkJCWJyZWFrOwogCQljYXNlIFBMQU5FX0NUTF9USUxFRF9YOgogCQkJaW5mby0+ZHJtX2Zv
cm1hdF9tb2QgPSBJOTE1X0ZPUk1BVF9NT0RfWF9USUxFRDsKKwkJCXRpbGVfaGVpZ2h0ID0gODsK
IAkJCWJyZWFrOwogCQljYXNlIFBMQU5FX0NUTF9USUxFRF9ZOgogCQkJaW5mby0+ZHJtX2Zvcm1h
dF9tb2QgPSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRDsKKwkJCXRpbGVfaGVpZ2h0ID0gMzI7CiAJ
CQlicmVhazsKIAkJY2FzZSBQTEFORV9DVExfVElMRURfWUY6CiAJCQlpbmZvLT5kcm1fZm9ybWF0
X21vZCA9IEk5MTVfRk9STUFUX01PRF9ZZl9USUxFRDsKKwkJCXRpbGVfaGVpZ2h0ID0gMzI7CiAJ
CQlicmVhazsKIAkJZGVmYXVsdDoKIAkJCWd2dF92Z3B1X2VycigiaW52YWxpZCB0aWxpbmcgbW9k
ZTogJXhcbiIsIHAudGlsZWQpOwpAQCAtMjY0LDggKzI2Nyw4IEBAIHN0YXRpYyBpbnQgdmdwdV9n
ZXRfcGxhbmVfaW5mbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1cm4gLUVJTlZBTDsK
IAl9CiAKLQlpbmZvLT5zaXplID0gKGluZm8tPnN0cmlkZSAqIGluZm8tPmhlaWdodCArIFBBR0Vf
U0laRSAtIDEpCi0JCSAgICAgID4+IFBBR0VfU0hJRlQ7CisJaW5mby0+c2l6ZSA9IChpbmZvLT5z
dHJpZGUgKiByb3VuZHVwKGluZm8tPmhlaWdodCwgdGlsZV9oZWlnaHQpCisJCSAgICAgICsgUEFH
RV9TSVpFIC0gMSkgPj4gUEFHRV9TSElGVDsKIAlpZiAoaW5mby0+c2l6ZSA9PSAwKSB7CiAJCWd2
dF92Z3B1X2VycigiZmIgc2l6ZSBpcyB6ZXJvXG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7Ci0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50
ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1n
dnQtZGV2
