Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3033853ywa;
        Mon, 18 Feb 2019 23:51:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYIrpzO003qaeOMuw1lr+acExQGd2GfV+tYwxcdc5nc2dLNMfHJG0BhSrXRgqcqpOua+eu7
X-Received: by 2002:a62:8a57:: with SMTP id y84mr28050646pfd.197.1550562701434;
        Mon, 18 Feb 2019 23:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550562701; cv=none;
        d=google.com; s=arc-20160816;
        b=avXeiFl7g84xzJAnLrc6sU8eElgr5R6JMs+cjFOqUreyTbt0RHpA5/eq4JXn2id10r
         e9PjcJco2ynPl/hfTJBjk+/KrXeOnXswmNCkisuGug2aSte0xOVGor6tJQYj4kLSVMKD
         /WaDlpxtmMMP2b89J74foe//zMWQ/tzBak7ko4ECtVQycFgL4vZHC+yZm5QYnSjCkNde
         oops2D73DI+QNbzBId1ewu2v7oDa4d9COf/NpVVmtifEZbboIn0mmK2A9yaPvTKA1ego
         3Wr0N0iBQUnNB+/kJNT2QeQ2lxfMiOCxjTw/HsitMJ4WXmVOmftmOIGDniX+X70fDWsJ
         KQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=ITQhii5XHre1hMFbXqBqPk0ZlvRbxo5Xke7X009cG8o=;
        b=yqvzHsHKyGMorgGWZ0iNGdTASb+c5OU404xJFO2IsCWOJjdztNp4XnJ07LCTL9nPSS
         dLeHdUOz3U7OZeWBSAf4MHu+8aSdRs2V+S+M6CCcS1vBn/KMLqu1hDqRdyr6gCWVCSIZ
         qo9+q1boEqufIkfnOt+63jIgJajOBVv5jhK7RHL0t5lmm6CBsVXBOY3TSjxlWyXcgfjg
         mjvs7eewlc7OMxmvg5/5nevJLbbTNPN44LPXyux/YzHri/li+/NyTotoJovpmoHfLtVz
         /kZPvlWUjhuGhC1hwaEXKOXReEaE1EQzLeUlMlfLh/kNL4iC1X7qV0cX0gpSBWOQGWZb
         EDrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l27si14824424pgm.456.2019.02.18.23.51.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:51:41 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1251C89262;
	Tue, 19 Feb 2019 07:51:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A84589264
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:51:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="147958391"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2019 23:51:37 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 6/8] drm/i915/gvt: Apply g2h adjustment to buffer start gma
 for dmabuf
Date: Tue, 19 Feb 2019 02:46:23 -0500
Message-Id: <20190219074623.14305-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219074242.14015-1-yan.y.zhao@intel.com>
References: <20190219074242.14015-1-yan.y.zhao@intel.com>
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
Cc: Yulei Zhang <yulei.zhang@intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
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
