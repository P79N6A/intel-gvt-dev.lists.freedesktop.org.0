Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp3027759ywo;
        Sun, 7 Apr 2019 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2uqhZ7LwAMurCT7j5Gbb7f+KudMvviNps2+66dMJ/BjAMFn6l48tKI2kIKHg4HHtwf7KM
X-Received: by 2002:aa7:9aa8:: with SMTP id x8mr5761474pfi.193.1554703075118;
        Sun, 07 Apr 2019 22:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554703075; cv=none;
        d=google.com; s=arc-20160816;
        b=jEMJjo8jWrwDCBziyzIp7O8ktr5ljoV9zs97rie/yDze3yffjFI+gKNdESfFHhlch7
         QdpKoXHSpJdI8QGJkn1mFYyhcow7McCZE+qF7ckC4nHtY+txJx0KdTC3pESKZP01U/Vm
         YVtfQGehWlf80QKZhwdXhUtfr63GmwOFpN42JzVNwcWdot3INbHEBGdvWe6g8FGBwsx0
         MZwqBwLImrap82s3m9yWIaHCbrIIYIusm8HRA3eYxfGEEQadObRSwfeOXckKI8PrDOYL
         K/IQBNtOB/4cl9BRD+oce9fc/vNHpOJWPx4CV8HHgdjfePq189EBbAIuUTcgmzEKn+L5
         /Gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=iz1PTUKvRZlK+HZRmZgqAXiUJNSytV0dOsya+1FDeJ4=;
        b=MX1iq3LyOMDH1gvdjbmgRZ6dw8cI4bTSo1HPAZgOseKtSRhbe7W5SfAfneRprpXGQ1
         s5+bddMDXGU1rv+O2N548zKyuA/dFMSo+jI4BltS7vLjbBIwDtQYYgOSJK7UXXj215E+
         /10lGjigRzWOI3Ok2XN1JlVVKN0uV5R+qvuXnEcTZyoDIiYG2DwQMbXMScgrGdLT6a4H
         X/d7QZVuAr7+4YB41X8PuZm9xq/3f1DeckkeE77X6NBGJJOKfoLYM/94hZxa0NvOM3IB
         U9DLCX0h96ihBnXaGsn15jlrROyK4B8KBf5ARaVfvUIuetw/lLM/N9z+Riz8KTNHUfRJ
         etuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id f11si9876332plo.169.2019.04.07.22.57.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2019 22:57:55 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B358C8926F;
	Mon,  8 Apr 2019 05:57:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4818926F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  8 Apr 2019 05:57:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Apr 2019 22:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,324,1549958400"; d="scan'208";a="148923484"
Received: from aleksei-desktop.tm.intel.com ([10.237.55.101])
 by orsmga002.jf.intel.com with ESMTP; 07 Apr 2019 22:57:51 -0700
From: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/5] drm/i915/gvt: Do not copy the uninitialized pointer from
 fb_info
Date: Mon,  8 Apr 2019 08:54:59 +0300
Message-Id: <20190408055502.8474-2-aleksei.gimbitskii@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
References: <20190408055502.8474-1-aleksei.gimbitskii@intel.com>
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
Cc: Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

SW4gdGhlIGNvZGUgdGhlIG1lbWNweSgpIGZ1bmN0aW9uIGNvcGllZCB1bmluaXRpYWxpemVkIHBv
aW50ZXIgaW4gZmJfaW5mbwp0byBkbWFidWZfb2JqLT5pbmZvLiBMYXRlciB0aGUgcG9pbnRlciBp
biBkbWFidWZfb2JqLT5pbmZvIHdpbGwgYmUKaW5pdGlhbGl6ZWQuIFRvIG1ha2UgdGhlIGNvZGUg
YWxpZ25lZCB3aXRoIHJlcXVpcmVtZW50cyBvZiB0aGUga2xvY3dvcmsKc3RhdGljIGNvZGUgYW5h
bHl6ZXIsIHRoZSB1bmluaXRpYWxpemVkIHBvaW50ZXIgc2hvdWxkIGJlIGluaXRpYWxpemVkCmJl
Zm9yZSBtZW1jcHkoKS4KClRoaXMgcGF0Y2ggZml4ZWQgdGhlIGNyaXRpY2FsIGlzc3VlICM2MzIg
cmVwb3J0ZWQgYnkga2xvY2t3b3JrLgoKU2lnbmVkLW9mZi1ieTogQWxla3NlaSBHaW1iaXRza2lp
IDxhbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPgpDYzogWmhlbnl1IFdhbmcgPHpoZW55dXdA
bGludXguaW50ZWwuY29tPgpDYzogWmhpIFdhbmcgPHpoaS5hLndhbmdAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1h
YnVmLmMKaW5kZXggZjZiZTk3MTE5OTY4Li5kODYwNTVjMTQ0YzIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZG1hYnVmLmMKQEAgLTQxOCw5ICs0MTgsOSBAQCBpbnQgaW50ZWxfdmdwdV9xdWVyeV9wbGFu
ZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdm9pZCAqYXJncykKIAkJcmV0ID0gLUVOT01FTTsK
IAkJZ290byBvdXRfZnJlZV9kbWFidWY7CiAJfQotCW1lbWNweShkbWFidWZfb2JqLT5pbmZvLCAm
ZmJfaW5mbywgc2l6ZW9mKHN0cnVjdCBpbnRlbF92Z3B1X2ZiX2luZm8pKTsKIAotCSgoc3RydWN0
IGludGVsX3ZncHVfZmJfaW5mbyAqKWRtYWJ1Zl9vYmotPmluZm8pLT5vYmogPSBkbWFidWZfb2Jq
OworCWZiX2luZm8ub2JqID0gZG1hYnVmX29iajsKKwltZW1jcHkoZG1hYnVmX29iai0+aW5mbywg
JmZiX2luZm8sIHNpemVvZihzdHJ1Y3QgaW50ZWxfdmdwdV9mYl9pbmZvKSk7CiAKIAlkbWFidWZf
b2JqLT52Z3B1ID0gdmdwdTsKIAotLSAKMi4xNy4xCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW50ZWwgRmlubGFu
ZCBPeQpSZWdpc3RlcmVkIEFkZHJlc3M6IFBMIDI4MSwgMDAxODEgSGVsc2lua2kgCkJ1c2luZXNz
IElkZW50aXR5IENvZGU6IDAzNTc2MDYgLSA0IApEb21pY2lsZWQgaW4gSGVsc2lua2kgCgpUaGlz
IGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRl
cmlhbCBmb3IKdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIEFueSBy
ZXZpZXcgb3IgZGlzdHJpYnV0aW9uCmJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQKcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUg
c2VuZGVyIGFuZCBkZWxldGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
