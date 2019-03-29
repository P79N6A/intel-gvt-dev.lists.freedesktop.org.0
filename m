Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1378059ywb;
        Thu, 28 Mar 2019 21:00:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD5vU82sL5kqVbldhHp4yWUKvuO98KJ4DYMqDqKx6wQ2+xoLwyueJm59XlErvVBSm4XIY/
X-Received: by 2002:a63:6f0a:: with SMTP id k10mr21459506pgc.78.1553832049536;
        Thu, 28 Mar 2019 21:00:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832049; cv=none;
        d=google.com; s=arc-20160816;
        b=x/Af1rTwC7Puh+slDRxVvZedO3kRh94UwTV6HBTvIWbxefrGJT/MJMVktX+0nVOnq3
         V2z0+EWnup43usRT/HpUMlnumpADzDDETVl60WVeGN1ix8cv4TxjE4HEsJ4+J5zDnjGZ
         HJRk3fa8XTB90+dvbwShc+a014PvwPKLoZ7TKRvW5tIYxMGhpgHuDfgWUfizgxxgtjeQ
         1xcpkNdT4zbBgVhZXFUvwlDStuBJ9/BIZGhBf/LgIJMzgO3OHjJIWFzWHP2sHnrwqw0+
         MIkXCaWcix6thgy3dJTH+X24tlaHxQauH/nKlendA0VfcL4zJvn9jD0iGRNBSIDd2eGm
         jjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=2pvmJxoFhxHXPm/vfrmGRE9Pr9onxHT9WBTGFSq2kHg=;
        b=zA8yUyXYdykkQoqzDGOvhUsIG7RL9JKA0zmKRWmVxpmUprif8i0VUGHTVGIGn9PqZ/
         2jYUA3fojmAxmTlOApz7Sh8ZNdl1GOIYsUrs2fskdOGbSwwtoWEjJ2NMivSMu3SS8rhI
         Kwc+ZqxGJpjI5Pr25cmFQlbEVCzG+q55vTPVusMppE4r4FZ9qon0v/C5GHPt+GS2PY96
         N+4ILVDvmNwKSPqCuxhG9ZhYyGIwNwxIPX+X2DnzTC6JQxNKkX6f9+hcI0//UpzmBPLp
         qs2Fpu9b+iuf05BIS2RaNN6Wa7NpnnTyMZYdCgPMSra1E0yhps6ejLScRPA5xE+fWlFx
         yEoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id l37si937085plb.173.2019.03.28.21.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:00:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C38A6E816;
	Fri, 29 Mar 2019 04:00:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236216E816;
 Fri, 29 Mar 2019 04:00:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129648383"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 21:00:45 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/8] drm/i915: introduced vgpu pv capability
Date: Fri, 29 Mar 2019 09:32:37 -0400
Message-Id: <1553866364-111114-2-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
References: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
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
Cc: Xiaolin Zhang <xiaolin.zhang@intel.com>, zhenyu.z.wang@intel.com,
 joonas.lahtinen@linux.intel.com, hang.yuan@intel.com, min.he@intel.com,
 zhiyuan.lv@intel.com, chris@chris-wilson.co.uk, zhi.a.wang@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

cHYgY2FwYWJpbGl0eSBmb3IgZ3Vlc3QgZ3B1IHdhcyBpbnRyb2R1Y2VkIGJ5IHB2X2NhcHMgaW4g
c3RydWN0Cmk5MTVfdmlydHVhbF9ncHUgYW5kIGEgbmV3IHB2X2NhcHMgcmVnaXN0ZXIgZm9yIGhv
c3QgR1ZUCndhcyBkZWZpbmVkIGluIHN0cnVjdCB2Z3RfaWYgZm9yIHZncHUgcHYgb3B0aW1pemF0
aW9uLgoKYm90aCBvZiB0aGVtIGFyZSB1c2VkIHRvIGNvbnRyb2wgZGlmZmVyZW50IGZlYXR1cmUg
cHYgb3B0aW1pemF0aW9uCnN1cHBvcnRlZCBhbmQgaW1wbGVtZW50ZWQgYnkgYm90aCBndWVzdCBh
bmQgaG9zdC4KClRoZXNlIGZpZWxkcyBhcmUgZGVmYXVsdCB6ZXJvLCBubyBhbnkgcHYgZmVhdHVy
ZSBlbmFibGVkLgoKaXQgYWxzbyBhZGRzIFZHVF9DQVBTX1BWIGNhcGFiaWxpdHkgQklUIGZvciBn
dWVzdCB0byBjaGVjayBHVlRnCmNhbiBzdXBwb3J0IFBWIGZlYXR1cmUgb3Igbm90LgoKdjA6IFJG
QywgaW50cm91ZGNlZCBlbmFibGVfcHZtbWlvIG1vZHVsZSBwYXJhbWV0ZXIuCnYxOiBhZGRyZXNz
ZWQgUkZDIGNvbW1lbnQgdG8gcmVtb3ZlIGVuYWJsZV9wdm1taW8gbW9kdWxlIHBhcmFtZXRlcgpi
eSBwdiBjYXBhYmlsaXR5IGNoZWNrLgp2MjogcmViYXNlCnYzOiBkaXN0aW5jdCBwdiBjYXBzIGZy
b20gZ3Vlc3QgYW5kIGhvc3QuIHJlbmFtZWQgZW5hYmxlX3B2bW1pbyB0bwpwdm1taW9fY2FwcyB3
aGljaCBpcyB1c2VkIGZvciBob3N0IHB2IGNhcHMuCnY0OiBjb25zb2xpZGF0ZWQgYWxsIHB2IHJl
bGF0ZWQgZnVuY3RvbnMgaW50byBhIHNpbmdsZSBmaWxlIGk5MTVfdmdwdS5jCmFuZCByZW5hbWVk
IHB2bW1pbyB0byBwdl9jYXBzLgoKU2lnbmVkLW9mZi1ieTogWGlhb2xpbiBaaGFuZyA8eGlhb2xp
bi56aGFuZ0BpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaCAg
ICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3B2aW5mby5oIHwgIDUgKysrKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jICAgfCA0NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1Lmgg
ICB8ICA4ICsrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAppbmRleCBlZmYwZTlhLi5iMGM1MGJiIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgKQEAgLTg2LDYgKzg2LDcgQEAKICNpbmNsdWRlICJpOTE1
X3ZtYS5oIgogCiAjaW5jbHVkZSAiaW50ZWxfZ3Z0LmgiCisjaW5jbHVkZSAiaTkxNV9wdmluZm8u
aCIKIAogLyogR2VuZXJhbCBjdXN0b21pemF0aW9uOgogICovCkBAIC0xMjQ2LDYgKzEyNDcsNyBA
QCBzdHJ1Y3QgaTkxNV9mcm9udGJ1ZmZlcl90cmFja2luZyB7CiBzdHJ1Y3QgaTkxNV92aXJ0dWFs
X2dwdSB7CiAJYm9vbCBhY3RpdmU7CiAJdTMyIGNhcHM7CisJdTMyIHB2X2NhcHM7CiB9OwogCiAv
KiB1c2VkIGluIGNvbXB1dGluZyB0aGUgbmV3IHdhdGVybWFya3Mgc3RhdGUgKi8KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcHZpbmZvLmggYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X3B2aW5mby5oCmluZGV4IDk2OWU1MTQuLjYxOTMwNWEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcHZpbmZvLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9wdmluZm8uaApAQCAtNTUsNiArNTUsNyBAQCBlbnVtIHZndF9nMnZfdHlwZSB7CiAj
ZGVmaW5lIFZHVF9DQVBTX0ZVTExfUFBHVFQJCUJJVCgyKQogI2RlZmluZSBWR1RfQ0FQU19IV1NQ
X0VNVUxBVElPTgkJQklUKDMpCiAjZGVmaW5lIFZHVF9DQVBTX0hVR0VfR1RUCQlCSVQoNCkKKyNk
ZWZpbmUgVkdUX0NBUFNfUFYJCUJJVCg1KQogCiBzdHJ1Y3Qgdmd0X2lmIHsKIAl1NjQgbWFnaWM7
CQkvKiBWR1RfTUFHSUMgKi8KQEAgLTEwNyw3ICsxMDgsOSBAQCBzdHJ1Y3Qgdmd0X2lmIHsKIAl1
MzIgZXhlY2xpc3RfY29udGV4dF9kZXNjcmlwdG9yX2xvOwogCXUzMiBleGVjbGlzdF9jb250ZXh0
X2Rlc2NyaXB0b3JfaGk7CiAKLQl1MzIgIHJzdjdbMHgyMDAgLSAyNF07ICAgIC8qIHBhZCB0byBv
bmUgcGFnZSAqLworCXUzMiBwdl9jYXBzOworCisJdTMyICByc3Y3WzB4MjAwIC0gMjVdOyAgICAv
KiBwYWQgdG8gb25lIHBhZ2UgKi8KIH0gX19wYWNrZWQ7CiAKICNkZWZpbmUgdmd0aWZfcmVnKHgp
IFwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMKaW5kZXggM2QwYjQ5My4uZTlmNmQ5NiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV92Z3B1LmMKQEAgLTc5LDcgKzc5LDE0IEBAIHZvaWQgaTkxNV9jaGVja192
Z3B1KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAlkZXZfcHJpdi0+dmdwdS5j
YXBzID0gX19yYXdfaTkxNV9yZWFkMzIodW5jb3JlLCB2Z3RpZl9yZWcodmd0X2NhcHMpKTsKIAog
CWRldl9wcml2LT52Z3B1LmFjdGl2ZSA9IHRydWU7Ci0JRFJNX0lORk8oIlZpcnR1YWwgR1BVIGZv
ciBJbnRlbCBHVlQtZyBkZXRlY3RlZC5cbiIpOworCisJaWYgKCFpbnRlbF92Z3B1X2NoZWNrX3B2
X2NhcHMoZGV2X3ByaXYpKSB7CisJCURSTV9JTkZPKCJWaXJ0dWFsIEdQVSBmb3IgSW50ZWwgR1ZU
LWcgZGV0ZWN0ZWQuXG4iKTsKKwkJcmV0dXJuOworCX0KKworCURSTV9JTkZPKCJWaXJ0dWFsIEdQ
VSBmb3IgSW50ZWwgR1ZULWcgZGV0ZWN0ZWQgd2l0aCBwdl9jYXBzIDB4JXguXG4iLAorCQkJZGV2
X3ByaXYtPnZncHUucHZfY2Fwcyk7CiB9CiAKIGJvb2wgaW50ZWxfdmdwdV9oYXNfZnVsbF9wcGd0
dChzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCkBAIC0yNzQsMyArMjgxLDM5IEBA
IGludCBpbnRlbF92Z3RfYmFsbG9vbihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYp
CiAJRFJNX0VSUk9SKCJWR1QgYmFsbG9vbiBmYWlsXG4iKTsKIAlyZXR1cm4gcmV0OwogfQorCisv
KgorICogaTkxNSB2Z3B1IFBWIHN1cHBvcnQgZm9yIExpbnV4CisgKi8KKworLyoqCisgKiBpbnRl
bF92Z3B1X2NoZWNrX3B2X2NhcHMgLSBkZXRlY3QgdmlydHVhbCBHUFUgUFYgY2FwYWJpbGl0aWVz
CisgKiBAZGV2X3ByaXY6IGk5MTUgZGV2aWNlIHByaXZhdGUKKyAqCisgKiBUaGlzIGZ1bmN0aW9u
IGlzIGNhbGxlZCBhdCB0aGUgaW5pdGlhbGl6YXRpb24gc3RhZ2UsIHRvIGRldGVjdCBWR1BVCisg
KiBQViBjYXBhYmlsaXRpZXMKKyAqCisgKiBJZiBndWVzdCB3YW50cyB0byBlbmFibGUgcHZfY2Fw
cywgaXQgbmVlZHMgdG8gY29uZmlnIGl0IGV4cGxpY2l0bHkKKyAqIHRocm91Z2ggdmd0X2lmIGlu
dGVyZmFjZSBmcm9tIGd2dCBsYXllci4KKyAqLworYm9vbCBpbnRlbF92Z3B1X2NoZWNrX3B2X2Nh
cHMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQoreworCXN0cnVjdCBpbnRlbF91
bmNvcmUgKnVuY29yZSA9ICZkZXZfcHJpdi0+dW5jb3JlOworCXUzMiBndnRfcHZjYXBzOworCXUz
MiBwdmNhcHM7CisKKwlpZiAoIWludGVsX3ZncHVfaGFzX3B2X2NhcHMoZGV2X3ByaXYpKQorCQly
ZXR1cm4gZmFsc2U7CisKKwkvKiBQViBjYXBhYmlsaXR5IG5lZ290aWF0aW9uIGJldHdlZW4gUFYg
Z3Vlc3QgYW5kIEdWVCAqLworCWd2dF9wdmNhcHMgPSBfX3Jhd19pOTE1X3JlYWQzMih1bmNvcmUs
IHZndGlmX3JlZyhwdl9jYXBzKSk7CisJcHZjYXBzID0gZGV2X3ByaXYtPnZncHUucHZfY2FwcyAm
IGd2dF9wdmNhcHM7CisJZGV2X3ByaXYtPnZncHUucHZfY2FwcyA9IHB2Y2FwczsKKworCWlmICgh
cHZjYXBzKQorCQlyZXR1cm4gZmFsc2U7CisKKwlfX3Jhd19pOTE1X3dyaXRlMzIodW5jb3JlLCB2
Z3RpZl9yZWcocHZfY2FwcyksIHB2Y2Fwcyk7CisKKwlyZXR1cm4gdHJ1ZTsKK30KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV92Z3B1LmgKaW5kZXggZWJlMWI3Yi4uOTEwMTBmYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV92Z3B1LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV92Z3B1LmgKQEAgLTQyLDcgKzQyLDE1IEBAIGludGVsX3ZncHVfaGFzX2h1Z2VfZ3R0KHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAlyZXR1cm4gZGV2X3ByaXYtPnZncHUuY2Fw
cyAmIFZHVF9DQVBTX0hVR0VfR1RUOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wKK2ludGVsX3Zn
cHVfaGFzX3B2X2NhcHMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQoreworCXJl
dHVybiBkZXZfcHJpdi0+dmdwdS5jYXBzICYgVkdUX0NBUFNfUFY7Cit9CisKIGludCBpbnRlbF92
Z3RfYmFsbG9vbihzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpOwogdm9pZCBpbnRl
bF92Z3RfZGViYWxsb29uKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdik7CiAKKy8q
IGk5MTUgdmdwdSBwdiByZWxhdGVkIGZ1bmN0aW9ucyAqLworYm9vbCBpbnRlbF92Z3B1X2NoZWNr
X3B2X2NhcHMoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KTsKICNlbmRpZiAvKiBf
STkxNV9WR1BVX0hfICovCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
