Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5577804ywb;
        Tue, 26 Mar 2019 22:01:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyw/7/GouigVNf4p9pUHKtCfpH4WB0DOVCcLtcaoWyIDk+kzyDage/uKmymFw1mPBlwGXcE
X-Received: by 2002:a62:307:: with SMTP id 7mr11858266pfd.259.1553662874123;
        Tue, 26 Mar 2019 22:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553662874; cv=none;
        d=google.com; s=arc-20160816;
        b=ksOFMUhMD+lbgiBFlA9zy5fYqJrXgcGOB3jqSazp7bQX7G2oRZwRxwuanucFkYol+Y
         UcDhTEjBVrJDwvvAZc+/g2BFLPI+pqky/X+7owfHLdAZf4SJxnGM8tonyxqtzPDm0+yC
         mX78vjqugk2556PoD5Ubb/vWeH8SWfB8dsGv8vGXo7JTIbFVSChne5ywggaPrB3tiPuG
         wmLyStfLwJvLLqHmAZLApzVBTilSgyOkap/R7LwA1wY8Oe+mgfLheqnPHeV8+OmE1kxE
         utje7cGSscs+paBpDccs6l0ywE8sOuuCxgra0ZX01hN2QXr3RG3Stb/5AnXYBF29Pn28
         LHlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=eZbalzuaw+8j+CijdSDExv0eNpYs+JxlTBcp+CdMXvs=;
        b=mV7hFWNmaGrmTqqbbG6cQI1geFNNnsL7sOtNSWY3Q58eGTttQ1fuzNiH7Trf/B/9k1
         NHd0Lrrgce4d13dssVFrRTYjqaMM/Vegjb9cVXXXYzl+vfq8M69Wx6ZkvQAp4698LqrC
         e5Ymf7wtI57xnKsoRKYgbctQvII8iJnBIDzMecYg3VqnuBDhfrUNjSbrhdRNA6akky8I
         72Q+A/DeTztpQ7fgu/f04wyDSKKaUGIE69Q+sTChaaXvGUJ/zhg0pRsN1mb05QDHtFdV
         L3TYvnXkBIv8wasA7iOdBjX8qixVQHZTMkuAtne6xknvkE86hrcNJwUd79svXR1jljRV
         TSqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l37si5333776plb.173.2019.03.26.22.01.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2019 22:01:14 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD96B6E08B;
	Wed, 27 Mar 2019 05:01:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300976E08B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 27 Mar 2019 05:01:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2019 22:01:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,275,1549958400"; d="scan'208";a="130502998"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga006.jf.intel.com with ESMTP; 26 Mar 2019 22:01:11 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915/gvt: do not let pin count of shadow mm go
 negative
Date: Wed, 27 Mar 2019 00:55:45 -0400
Message-Id: <20190327045545.16022-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327045451.15970-1-yan.y.zhao@intel.com>
References: <20190327045451.15970-1-yan.y.zhao@intel.com>
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, stable@vger.kernel.org,
 zhenyuw@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

c2hhZG93IG1tJ3MgcGluIGNvdW50IGdvdCBpbmNyZWFzZWQgaW4gd29ya2xvYWQgcHJlcGFyYXRp
b24gcGhhc2UsIHdoaWNoCmlzIGFmdGVyIHdvcmtsb2FkIHNjYW5uaW5nLgppdCB3aWxsIGdldCBk
ZWNyZWFzZWQgaW4gY29tcGxldGVfY3VycmVudF93b3JrbG9hZCgpIGFueXdheSBhZnRlcgp3b3Jr
bG9hZCBjb21wbGV0aW9uLgpTb21ldGltZXMsIGlmIGEgd29ya2xvYWQgbWVldHMgYSBzY2Fubmlu
ZyBlcnJvciwgaXRzIHNoYWRvdyBtbSBwaW4gY291bnQKd2lsbCBub3QgZ2V0IGluY3JlYXNlZCBi
dXQgd2lsbCBnZXQgZGVjcmVhc2VkIGluIHRoZSBlbmQuClRoaXMgcGF0Y2ggbGV0cyBzaGFkb3cg
bW0ncyBwaW4gY291bnQgbm90IGdvIGJlbG93IDAuCgp2MjogYWRkIGZpeGVzIHRhZyBhbmQgY2Mg
c3RhYmxlIGtlcm5lbCAoemhlbnl1IHdhbmcpCkZpeGVzOiAyNzA3ZTQ0NDY2ODggKCJkcm0vaTkx
NS9ndnQ6IHZHUFUgZ3JhcGhpY3MgbWVtb3J5IHZpcnR1YWxpemF0aW9uIikKQ2M6IHpoZW55dXdA
bGludXguaW50ZWwuY29tCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICM0LjE0KwpTaWduZWQt
b2ZmLWJ5OiBZYW4gWmhhbyA8eWFuLnkuemhhb0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d0dC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCmluZGV4IGY0Yzk5MmQ5NjA4Ny4u
ODhlZDJlOWRmMjUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC0xOTQ2LDcgKzE5NDYsNyBA
QCB2b2lkIF9pbnRlbF92Z3B1X21tX3JlbGVhc2Uoc3RydWN0IGtyZWYgKm1tX3JlZikKICAqLwog
dm9pZCBpbnRlbF92Z3B1X3VucGluX21tKHN0cnVjdCBpbnRlbF92Z3B1X21tICptbSkKIHsKLQlh
dG9taWNfZGVjKCZtbS0+cGluY291bnQpOworCWF0b21pY19kZWNfaWZfcG9zaXRpdmUoJm1tLT5w
aW5jb3VudCk7CiB9CiAKIC8qKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1n
dnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
