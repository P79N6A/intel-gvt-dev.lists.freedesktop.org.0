Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp213165ywb;
        Tue, 19 Mar 2019 20:22:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyHAyMKInPXzrhkxD1fnztCjh2tyG5dQUA3ETPaIZPQmrcqvgRi9cZq3T1w8Gpz2TZWNojn
X-Received: by 2002:a63:614c:: with SMTP id v73mr11397754pgb.395.1553052133608;
        Tue, 19 Mar 2019 20:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052133; cv=none;
        d=google.com; s=arc-20160816;
        b=vOXFVbwKTXY+Zh8HcDeqQ/Sd/VQMKkUrXj4M3ulO6E+7/k1Wq9CStQg5gblHptijkm
         54cp4wrKSU8TqGCOKPaZeyh5t6VHbK34dtsvFgO3sz5nWcJELNE6xNpnVSrRxJVj6wKH
         WBMekiSa8yavzz7R+EggMOyejc7w8sXZo/fRYv2bLOvgUzikAyokvynbhHSUMkk7fQy6
         vkrNYmH1a93oc5mL92yr3fwcc5mVqywlHUmDpTbryAzyFfk9TdQ6SUbUkK64fV4OP+tn
         tLv96a8PBMLZHoFwyzgBmnQb+QItzKuisVsQk2TjMef+ddozqNpnGv8kAP5ClEwSZG5Q
         Y/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:references:in-reply-to:message-id:date
         :subject:to:from:delivered-to;
        bh=Dj3A9pZn9dG7mjM7wjFCytkXvP7igDfz9tispwIkA+Y=;
        b=NfzRv4kq+OUaNKGXFp4TErH3HM05oE0Rl26qwGBq9+TkXhIpTLkJxkJgkHeP5bodCk
         PbA+qMgz199uzIAf5SqGIQPG0C1vQg2I0ShR6P0pwMPTRCCqyXZJSYxtmKKO7SPONNJ1
         nBd/IJ39L5xhc/ck0G8f8F8ZMASgg43KzsARF2h47vf+/uFJBVCYuqLUE9/pKb9XCjUn
         oYgQMzLKCSUyPfH88RVR/lQ0gFaHvR2YP6a2GfREBE4zoc4zQf4AGlsxTAfnlyrSqVAT
         6DVzm57mABYE9qi755x0Ui7hcDd/HQOTgkM1VW5vgCbrTvPSmNZmDxX7KdmCrKVaZbhg
         igtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y4si622253pfy.157.2019.03.19.20.22.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:22:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC589BAF;
	Wed, 20 Mar 2019 03:22:13 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8655189BAF
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:22:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707393"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:22:11 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915/gvt: Prevent invalid ring_id access to array
 regs[]
Date: Wed, 20 Mar 2019 11:21:26 +0800
Message-Id: <20190320032130.9817-3-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320032130.9817-1-colin.xu@intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
MIME-Version: 1.0
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
Cc: colin.xu@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Z3Z0IG9ubHkgaW5pdHMgcmluZyByZWdzIGZvciBleGlzdGluZyByaW5nIGluIHN1cHBvcnRlZCBH
RU4gZ3JhcGhpY3MsCnRoZSByaW5nX2lkIGNvdWxkIGJlIGluY29udGludW91cyBzbyByZWdzW10g
Y291bGQgaGF2ZSB1bmluaXRpYWxpemVkCnZhbHVlLiBTbyBsaW1pdCB0aGUgcmluZ19pZCB0byBp
bml0aWxpemVkIHJpbmdzLgpBY2Nlc3MgdG8gdGhlbSBjb3VsZCBjYXVzZSB1bmV4cGVjdGVkIGJl
aGF2aW91cnMuIEFsdGhvdWdoIHRoZXNlIGFjY2VzcwphcmUgcHJvdGVjdGVkIGJ5IGN1cnJlbnQg
Z3Z0IGxvZ2ljIGFuZCB3b24ndCBoaXQgZHVyaW5nIHJ1bm5pbmcsIGJ1dCBzdGlsbApoYXMgcG90
ZW50aWFsIHNlY3VyaXR5IHJpc2sgaW4gZnV0dXJlLgoKaW50ZWxfY29udGV4dF9sb29rdXAoKSBj
b3VsZCByZXR1cm4gTlVMTCBidXQgaXNfaW5oaWJpdF9jb250ZXh0KCkgd2lsbAphY2Nlc3MgdGhl
IHBvaW50ZXIuIFZhbGlkYXRlIGludGVsX2NvbnRleHQgcG9pbnRlciBiZWZvcmUgdXNpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBYdSA8Y29saW4ueHVAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyB8IDIyICsrKysrKysrKysrKysrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwppbmRleCA4YTJmNmU5ZDIyNTcuLjAx
NjAyYzJlZDg1YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29u
dGV4dC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYwpAQCAt
MTYyLDYgKzE2Miw5IEBAIHN0YXRpYyB2b2lkIGxvYWRfcmVuZGVyX21vY3Moc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogCWZvciAocmluZ19pZCA9IDA7IHJpbmdfaWQgPCBBUlJB
WV9TSVpFKHJlZ3MpOyByaW5nX2lkKyspIHsKIAkJaWYgKCFIQVNfRU5HSU5FKGRldl9wcml2LCBy
aW5nX2lkKSkKIAkJCWNvbnRpbnVlOworCQlpZiAocmluZ19pZCAhPSBSQ1MwICYmIHJpbmdfaWQg
IT0gVkNTMCAmJiByaW5nX2lkICE9IFZDUzEgJiYKKwkJICAgIHJpbmdfaWQgIT0gQkNTMCAmJiBy
aW5nX2lkICE9IFZFQ1MwKQorCQkJY29udGludWU7CiAJCW9mZnNldC5yZWcgPSByZWdzW3Jpbmdf
aWRdOwogCQlmb3IgKGkgPSAwOyBpIDwgR0VOOV9NT0NTX1NJWkU7IGkrKykgewogCQkJZ2VuOV9y
ZW5kZXJfbW9jcy5jb250cm9sX3RhYmxlW3JpbmdfaWRdW2ldID0KQEAgLTM0MCw4ICszNDMsMTIg
QEAgc3RhdGljIHZvaWQgaGFuZGxlX3RsYl9wZW5kaW5nX2V2ZW50KHN0cnVjdCBpbnRlbF92Z3B1
ICp2Z3B1LCBpbnQgcmluZ19pZCkKIAkJW1ZFQ1MwXSA9IDB4NDI3MCwKIAl9OwogCi0JaWYgKFdB
Uk5fT04ocmluZ19pZCA+PSBBUlJBWV9TSVpFKHJlZ3MpKSkKKwlpZiAocmluZ19pZCAhPSBSQ1Mw
ICYmIHJpbmdfaWQgIT0gVkNTMCAmJiByaW5nX2lkICE9IFZDUzEgJiYKKwkgICAgcmluZ19pZCAh
PSBCQ1MwICYmIHJpbmdfaWQgIT0gVkVDUzApIHsKKwkJV0FSTl9PTigxKTsKKwkJZ3Z0X3ZncHVf
ZXJyKCJJbnZhbGlkIHJpbmcgaWQgKCVkKVxuIiwgcmluZ19pZCk7CiAJCXJldHVybjsKKwl9CiAK
IAlpZiAoIXRlc3RfYW5kX2NsZWFyX2JpdChyaW5nX2lkLCAodm9pZCAqKXMtPnRsYl9oYW5kbGVf
cGVuZGluZykpCiAJCXJldHVybjsKQEAgLTM4OSw4ICszOTYsMTMgQEAgc3RhdGljIHZvaWQgc3dp
dGNoX21vY3Moc3RydWN0IGludGVsX3ZncHUgKnByZSwgc3RydWN0IGludGVsX3ZncHUgKm5leHQs
CiAJaW50IGk7CiAKIAlkZXZfcHJpdiA9IHByZSA/IHByZS0+Z3Z0LT5kZXZfcHJpdiA6IG5leHQt
Pmd2dC0+ZGV2X3ByaXY7Ci0JaWYgKFdBUk5fT04ocmluZ19pZCA+PSBBUlJBWV9TSVpFKHJlZ3Mp
KSkKKworCWlmIChyaW5nX2lkICE9IFJDUzAgJiYgcmluZ19pZCAhPSBWQ1MwICYmIHJpbmdfaWQg
IT0gVkNTMSAmJgorCSAgICByaW5nX2lkICE9IEJDUzAgJiYgcmluZ19pZCAhPSBWRUNTMCkgewor
CQlXQVJOX09OKDEpOworCQlndnRfZXJyKCJJbnZhbGlkIHJpbmcgaWQgKCVkKVxuIiwgcmluZ19p
ZCk7CiAJCXJldHVybjsKKwl9CiAKIAlpZiAocmluZ19pZCA9PSBSQ1MwICYmCiAJICAgIChJU19L
QUJZTEFLRShkZXZfcHJpdikgfHwKQEAgLTQ1OCw2ICs0NzAsNyBAQCBzdGF0aWMgdm9pZCBzd2l0
Y2hfbW1pbyhzdHJ1Y3QgaW50ZWxfdmdwdSAqcHJlLAogCXN0cnVjdCBkcm1faTkxNV9wcml2YXRl
ICpkZXZfcHJpdjsKIAlzdHJ1Y3QgaW50ZWxfdmdwdV9zdWJtaXNzaW9uICpzOwogCXN0cnVjdCBl
bmdpbmVfbW1pbyAqbW1pbzsKKwlzdHJ1Y3QgaW50ZWxfY29udGV4dCAqY2UgPSBOVUxMOwogCXUz
MiBvbGRfdiwgbmV3X3Y7CiAKIAlkZXZfcHJpdiA9IHByZSA/IHByZS0+Z3Z0LT5kZXZfcHJpdiA6
IG5leHQtPmd2dC0+ZGV2X3ByaXY7CkBAIC00OTUsOSArNTA4LDggQEAgc3RhdGljIHZvaWQgc3dp
dGNoX21taW8oc3RydWN0IGludGVsX3ZncHUgKnByZSwKIAkJCSAqIGltYWdlIGlmIGl0J3Mgbm90
IGluaGliaXQgY29udGV4dCwgaXQgd2lsbCByZXN0b3JlCiAJCQkgKiBpdHNlbGYuCiAJCQkgKi8K
LQkJCWlmIChtbWlvLT5pbl9jb250ZXh0ICYmCi0JCQkgICAgIWlzX2luaGliaXRfY29udGV4dChp
bnRlbF9jb250ZXh0X2xvb2t1cChzLT5zaGFkb3dfY3R4LAotCQkJCQkJCQkgICAgIGRldl9wcml2
LT5lbmdpbmVbcmluZ19pZF0pKSkKKwkJCWNlID0gaW50ZWxfY29udGV4dF9sb29rdXAocy0+c2hh
ZG93X2N0eCwgZGV2X3ByaXYtPmVuZ2luZVtyaW5nX2lkXSk7CisJCQlpZiAobW1pby0+aW5fY29u
dGV4dCAmJiBjZSAmJiAhaXNfaW5oaWJpdF9jb250ZXh0KGNlKSkKIAkJCQljb250aW51ZTsKIAog
CQkJaWYgKG1taW8tPm1hc2spCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
