Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3019582ywa;
        Mon, 18 Feb 2019 23:30:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ3//3IvV4mNYJhe6IwlGYVJQ+ULjwCjuT12s/hG0y0rW33r1POPrnNz8dLfl5aoOCxyEOQ
X-Received: by 2002:a62:a1a:: with SMTP id s26mr28193072pfi.31.1550561411712;
        Mon, 18 Feb 2019 23:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550561411; cv=none;
        d=google.com; s=arc-20160816;
        b=ABdH6fydCLDcfKfRTi2cVPD9UpWn9mSqKJR1zPV1uSNUiitQCsTSMNNB/IYYeZ/07S
         6i6ScbbcN02sQFD6L2B8S0VmRA5Okht5ghFAfahGfUS5xFJ1bMfYSeFlQy7dabOAMzB0
         lUiUkxPYRGuIlCIJOh2BNz1m26ICdH2KQUXSzr/S/5yOeGRa1LjEj/drwRAUU2zntYzd
         BK08KXshM0hpyTncx3AC0nGLInj/8V3R2Y4OA3/ASDTS1PoGWDLuz73CezSDBwDv1kns
         OykWh0lvdfohLas60+6iAkwUAt5hRtBytM6XRByvME3mwSzzo1aNevZXgJQ59eo6fqKF
         PnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=ITQhii5XHre1hMFbXqBqPk0ZlvRbxo5Xke7X009cG8o=;
        b=cvD1gwBi0vuyNKULbEN4rt4GJO6QPw2vpydz0L9p/mQC48Bv3T1p+j3Vlx+n4fqRSf
         A9OroytBPtRk+oJUZsGCqD5V+BfSJHTYzi1/8MIBTyguvF70F8evQQNYajDPIrq4m5tx
         E9Es/xt6uXz+HymAxdIJ8zr3S9sXIANUmib1tcorivYO1He/eBJHRYZYsLkF0NJDe3DJ
         bjr79DhC3yKJRmMfUMtWQFAd7Ht4AyNokWqtYtovVyu5XepkPp3e4rCHSxrCRdNQPb7L
         J5dp3MY+Qtsh91TgpT8+WduQu7lAkaXYrJ+3wk45ZCZxxjBLQs77WXpP/kOhKtXn3WaE
         f/og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 1si16273830plv.138.2019.02.18.23.30.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:30:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5335689242;
	Tue, 19 Feb 2019 07:30:11 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519389242
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:30:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:30:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="276083459"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 18 Feb 2019 23:30:06 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 6/8] drm/i915/gvt: Apply g2h adjustment to buffer start gma
 for dmabuf
Date: Tue, 19 Feb 2019 02:24:50 -0500
Message-Id: <20190219072450.13827-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219071914.13424-1-yan.y.zhao@intel.com>
References: <20190219071914.13424-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

RnJvbTogWXVsZWkgWmhhbmcgPHl1bGVpLnpoYW5nQGludGVsLmNvbT4KCkFkanVzdCB0aGUgYnVm
ZmVyIHN0YXJ0IGdtYSBpbiBkbWFidWYgZm9yIGRpc3BsYXkgaW4gaG9zdCBkb21haW4uCgpTaWdu
ZWQtb2ZmLWJ5OiBZdWxlaSBaaGFuZyA8eXVsZWkuemhhbmdAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1
Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCmluZGV4IDUxZWQ5OWEzNzgw
My4uZTk2YzY1NWM0MGJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1h
YnVmLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC0yOTMsNiAr
MjkzLDkgQEAgc3RhdGljIGludCB2Z3B1X2dldF9wbGFuZV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsCiAJCXJldHVybiAtRUZBVUxUOwogCX0KIAorCS8qIEFwcGx5IGcyaCBhZGp1c3QgdG8g
YnVmZmVyIHN0YXJ0IGdtYSBmb3IgZGlzcGxheSAqLworCWludGVsX2d2dF9nZ3R0X2dtYWRyX2cy
aCh2Z3B1LCBpbmZvLT5zdGFydCwgJmluZm8tPnN0YXJ0KTsKKwogCXJldHVybiAwOwogfQogCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ3Z0LWRldg==
