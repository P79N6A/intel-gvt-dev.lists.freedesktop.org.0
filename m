Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp601494ywa;
        Thu, 14 Feb 2019 00:53:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZqcxGa2c1PIf0Q/rXX5sABVoE+4ISK3PA3RLFCU809i5/NWiFz1b+wbZskh6wITDIu5ISF
X-Received: by 2002:a17:902:243:: with SMTP id 61mr2856833plc.249.1550134385853;
        Thu, 14 Feb 2019 00:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550134385; cv=none;
        d=google.com; s=arc-20160816;
        b=OCAk6D61TvxhXMG4Q8VnFgW5vyIaAiLGBhGOVArtM85QpfiRLmKek7V+9WfEU+6efx
         A5CPfe9CdCrhEfz7qZAAUNQGazQZ4FH0okmvxFOSqC7Kst5/WvueXtVlqb6bYPTEZYF1
         r7FwUXCyfeyYCc/HbrOwlpOu0m3BwaTQNemxTbOq0UkqsYh3jF40oh6VZdO6HPYKwXaf
         Ug0NVRWJyEKvskNqoKyhcZN/C+vWpwlV1vcR1dctl9Y30m4vCvw1xK06yJP53nhtUCcq
         M4mBMcxwK+hmimqx8UmWYBsmfMyYWA5RILfICJrZwtMjW6s0x76zUw74G1TQt045MiW7
         P7kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=rGN4r4K4AFInXleJeAogTZh0Z06Pgt34JlKEbzhW3ZA=;
        b=pXtxSRHTvyx1F4irKXu7tbmNLQNdfOK/ioTyrGBrsOmqBlGkI5BLrEjlE0ESYnkZ7K
         4uItgqAkDHqyTGFPaoaxQMWD7K/Q/zHf+O/vSb+p4wyqbFhiy/Qe1cOtP1JXK9RzLGaC
         OjejniAr3upTOHJO0MG7i4pwXpkFVEhAbMdrAtEkJ1eaDJc/rvS2sy7mtNkvD+p6jA+E
         HqoNAms4b4lLW0sXw2iPunPG7yowTVhDHRwENqi7hAXmA8TwjrchfSNIdH+Y3MvTqD7V
         W6i8sgG4rL4O2PtNGvqg07nHtZtVwoqaGyMgvCyPerags6VCJLzNQspoduvL4j9GSeQR
         rT4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id j3si1832071pgf.402.2019.02.14.00.53.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Feb 2019 00:53:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E3F6E37F;
	Thu, 14 Feb 2019 08:53:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085476E38A
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 14 Feb 2019 08:52:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Feb 2019 00:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="318928911"
Received: from genxtest-ykzhao.sh.intel.com ([10.239.143.71])
 by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2019 00:52:47 -0800
From: Zhao Yakui <yakui.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/gvt: Refine the combined intel_vgpu_oos_page
 struct to save memory
Date: Thu, 14 Feb 2019 17:09:17 +0800
Message-Id: <1550135357-30932-2-git-send-email-yakui.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
References: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
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
Cc: Zhao Yakui <yakui.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhlIGludGVsX3ZncHVfb29zX3BhZ2UgdXNlcyB0aGUgY29tYmluZWQgc3RydWN0dXJlLCB3aGlj
aCBlbWJkZWRzIHRoZQp0cmFja2VkIHBhZ2UuIEFzIGl0IGlzIGFsbG9jYXRlZCBieSBrbWFsbG9j
LCB0aGUgc2l6ZSg0MTQwKSBpcyBhbGlnbmVkCnRvIDgxOTIuIFRoZSA4MTkyIG9vc19wYWdlcyB3
aWxsIHdhc3RlIGFib3V0IDMyTSBtZW1vcnkuClNvIHRoZSB0cmFja2VkIHBhZ2UgaXMgc3BsaXQg
ZnJvbSB0aGUgaW50ZWxfdmdwdV9vb3NfcGFnZS4gQW5kIHRoaXMgd2lsbApoZWxwIHRvIGFzc3Vy
ZSB0aGF0IHRoZSBhY2Nlc3Mgb2YgdHJhY2tlZCBwYWdlIGlzIGNhY2hlIGFsaWduZWQuCgpBbm90
aGVyIG1pbm9yIGNoYW5nZSBpcyB0aGF0IGl0IGRvZXNuJ3QgbmVlZCB0byBiZSBjbGVhcmVkIHRv
IHplcm8gYXMKaXQgaXMgd3JpdGVuIGZpcnN0bHkgd2hlbiBvbmUgcGFnZSBpcyBhZGRlZCB0byBv
b3NfcGFnZSBsaXN0LgoKU2lnbmVkLW9mZi1ieTogWmhhbyBZYWt1aSA8eWFrdWkuemhhb0BpbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jIHwgNyArKysrKysrCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d2dC9ndHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYwppbmRleCBj
NzEwM2RkLi45YmExZWQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jCkBAIC0yNDg5LDYgKzI0ODks
NyBAQCBzdGF0aWMgdm9pZCBjbGVhbl9zcHRfb29zKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkKIAls
aXN0X2Zvcl9lYWNoX3NhZmUocG9zLCBuLCAmZ3R0LT5vb3NfcGFnZV9mcmVlX2xpc3RfaGVhZCkg
ewogCQlvb3NfcGFnZSA9IGNvbnRhaW5lcl9vZihwb3MsIHN0cnVjdCBpbnRlbF92Z3B1X29vc19w
YWdlLCBsaXN0KTsKIAkJbGlzdF9kZWwoJm9vc19wYWdlLT5saXN0KTsKKwkJZnJlZV9wYWdlKCh1
bnNpZ25lZCBsb25nKW9vc19wYWdlLT5tZW0pOwogCQlrZnJlZShvb3NfcGFnZSk7CiAJfQogfQpA
QCAtMjUwOSw2ICsyNTEwLDEyIEBAIHN0YXRpYyBpbnQgc2V0dXBfc3B0X29vcyhzdHJ1Y3QgaW50
ZWxfZ3Z0ICpndnQpCiAJCQlyZXQgPSAtRU5PTUVNOwogCQkJZ290byBmYWlsOwogCQl9CisJCW9v
c19wYWdlLT5tZW0gPSAodm9pZCAqKV9fZ2V0X2ZyZWVfcGFnZXMoR0ZQX0tFUk5FTCwgMCk7CisJ
CWlmICghb29zX3BhZ2UtPm1lbSkgeworCQkJcmV0ID0gLUVOT01FTTsKKwkJCWtmcmVlKG9vc19w
YWdlKTsKKwkJCWdvdG8gZmFpbDsKKwkJfQogCiAJCUlOSVRfTElTVF9IRUFEKCZvb3NfcGFnZS0+
bGlzdCk7CiAJCUlOSVRfTElTVF9IRUFEKCZvb3NfcGFnZS0+dm1fbGlzdCk7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dnQvZ3R0LmgKaW5kZXggZDhjYjA0Yy4uZTlmNzJhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2d0dC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaApA
QCAtMjIxLDcgKzIyMSw3IEBAIHN0cnVjdCBpbnRlbF92Z3B1X29vc19wYWdlIHsKIAlzdHJ1Y3Qg
bGlzdF9oZWFkIGxpc3Q7CiAJc3RydWN0IGxpc3RfaGVhZCB2bV9saXN0OwogCWludCBpZDsKLQl1
bnNpZ25lZCBjaGFyIG1lbVtJOTE1X0dUVF9QQUdFX1NJWkVdOworCXZvaWQgKm1lbTsKIH07CiAK
ICNkZWZpbmUgR1RUX0VOVFJZX05VTV9JTl9PTkVfUEFHRSA1MTIKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1h
aWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
