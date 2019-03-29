Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1377522ywb;
        Thu, 28 Mar 2019 21:00:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxS2abAiwqciIk5FchBaGDdyFGopWXllKvJ4gE2s2Fl55d4D+Uefs+mnrQQKHufXAYsrb2
X-Received: by 2002:a17:902:b617:: with SMTP id b23mr44274953pls.200.1553832009058;
        Thu, 28 Mar 2019 21:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553832009; cv=none;
        d=google.com; s=arc-20160816;
        b=EiO5sugykNlWEjSwAJDivFRmkdk+esQzLMYqqR2gVCbqr1GLivvv8d58tIA2XJciaY
         za8MawBHf5hmvLGlmUx8QXifw7xhkgPyUGrNsrgqP9oePYK7N2Q8n6pv8Xwhf+pQHilr
         jEfGiFAGgpR2pnS//ro78GGTEVhCwfbjFxEkGzdCFXnot6sOpUr7ZaBaSGNN6Y90teI5
         0XcSZl9vb30WAXRYDCIhkfs/0s5cK3PR3HljgaGmCE4j3aO2FxUPeKGEY+h/WC46bZ7x
         krWiUul6mOH24KXit3481lRiff3jpceQ7bg4gNlXmuNU0oYjcR79uonKoLCUWvD0+t40
         Hg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=ksAf/uiegBFCnGX4+8Ce+79CyAm/1HbJfy6M/lj1CXw=;
        b=Qjgki/lAXolcpUzkWq/86v1HwzM4F/lmAS+MnqW9sRrZgSRTglDf3gB2zG1IDOoHX+
         sXQfOwO8PqnQ4i/lYI/++y4bvQXQThjA73iPl0udUdQTIj91IySo7pND2QcHz8sCXeQl
         vpEwU9b+nBw6YjaMpQR+IkAJ1rnnqyYFNbAU+Ul23sEVloCrQP2ZUYt2G4pVvQQtrjw+
         RiTJk5rt6zCS6Dwolf9hfJIOdeYtxawbvEhiqVo6KfWeH+OVyp+VlNbxlkFXcUziEQj0
         nBF0teGDuWgQQGsgkuXYrQ+rmZ4GjBMJXdvaZrVY2MUFJtmPIvD1oRXUCiA3x2ccbTK7
         owkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v21si859209pff.44.2019.03.28.21.00.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 21:00:09 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FDD6E816;
	Fri, 29 Mar 2019 04:00:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43606E815;
 Fri, 29 Mar 2019 04:00:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Mar 2019 21:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,283,1549958400"; d="scan'208";a="129647669"
Received: from vca-bj120.bj.intel.com ([10.240.192.119])
 by orsmga008.jf.intel.com with ESMTP; 28 Mar 2019 21:00:00 -0700
From: Xiaolin Zhang <xiaolin.zhang@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/8]  i915 vgpu PV to improve vgpu performance
Date: Fri, 29 Mar 2019 09:32:36 -0400
Message-Id: <1553866364-111114-1-git-send-email-xiaolin.zhang@intel.com>
X-Mailer: git-send-email 1.8.3.1
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

VG8gaW1wcm92ZSB2Z3B1IHBlcmZvcm1hbmNlLCBpdCBjb3VsZCBpbXBsZW1lbnQgc29tZSBQViBv
cHRpbWl6YXRpb24Kc3VjaCBhcyB0byByZWR1Y2UgdGhlIG1taW8gYWNjZXNzIHRyYXAgbnVtYmVy
cyBvciBlbGltaW5hdGUgY2VydGFpbiBwaWVjZQpvZiBIVyBlbXVsYXRpb24gd2l0aGluIGd1ZXN0
IGRyaXZlciB0byByZWR1Y2Ugdm0gZXhpdC92bSBlbnRlciBjb3N0LgoKdGhlIHNvbHV0aW9ucyBp
biB0aGlzIHBhdGNoIHNldCBhcmUgaW1wbGVtZW50ZWQgdHdvIFBWIG9wdGltaXphdGlvbnMgYmFz
ZWQKb24gdGhlIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGJldHdlZW4gZ3Vlc3QgYW5kIEdWVGcgZm9y
IGRhdGEgY29tbXVuaWNhdGlvbi4KVGhlIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGlzIGFsbG9jYXRl
ZCBieSBndWVzdCBkcml2ZXIgYW5kIHRoaXMKcmVnaW9uJ3MgbWVtb3J5IGd1ZXN0IHBoeXNpY2Fs
IGFkZHJlc3Mgd2lsbCBiZSBwYXNzZWQgdG8gR1ZUZyB0aHJvdWdoClBWSU5GTyByZWdpc3RlciBh
bmQgbGF0ZXIgR1ZUZyBjYW4gYWNjZXNzIHRoaXMgcmVnaW9uIGRpcmVjdGx5IHdpdGhvdXQKdHJh
cCBjb3N0IHRvIGFjaGlldmUgZGF0YSBleGNoYW5nZSBwdXJwb3NlIGJldHdlZW4gZ3Vlc3QgYW5k
IEdWVGcuCgppbiB0aGlzIHBhdGNoIHNldCwgMiBraW5kIG9mIFBWIG9wdGltaXphdGlvbiBpbXBs
ZW1lbnRlZCBjb250cm9sbGVkIGJ5CnB2X2NhcHMgUFZJTk8gcmVnaXN0ZXIgd2l0aCBkaWZmZXJl
bnQgcHYgYml0LgoxLiB3b3JrbG9hZCBQViBzdWJtaXNzaW9uIChjb250ZXh0IHN1Ym1pc3Npb24p
OiByZWR1Y2UgNCB0cmFwcyB0byAxIHRyYXAKYW5kIGVsaW1pbmF0ZWQgZXhlY2xpc3RzIEhXIGJl
aGF2aW91ciBlbXVsYXRpb24uCjIuIHBwZ3R0IFBWIHVwZGF0ZTogZWxpbWluYXRlIHRoZSBjb3N0
IG9mIHBwZ3R0IHdyaXRlIHByb3RlY3Rpb24uCgpiYXNlZCBvbiB0aGUgZXhwZXJpbWVudCwgZm9y
IHNtYWxsIHdvcmtsb2Fkcywgc3BlY2lmYWxseSwgZ2x4Z2VhcnMgd2l0aAp2YmxhbmtfbW9kZSBv
ZmYsIHRoZSBhdmVyYWdlIHBlcmZvcm1hbmNlIGdhaW4gb24gc2luZ2xlIHZncHUgaXMgMzB+NTAl
Lgpmb3IgbGFyZ2Ugd29ya2xvYWQgc3VjaCBhcyBtZWRpYSBhbmQgM0QsIHRoZSBhdmVyYWdlIHBl
cmZvcm1hbmNlIGdhaW4KaXMgYWJvdXQgNCUuIAoKYmFzZWQgb24gdGhlIFBWIG1lY2hhbmlzbSwg
aXQgY291bGQgYWNoaXZlIG1vcmUgdmdwdSBmZWF0dXJlIG9wdGltaXphdGlvbgpzdWNoIGFzIGds
b2JsZSBHVFQgdXBkYXRlLCBkaXNwbGF5IHBsYW5lIGFuZCB3YXRlciBtYXJrIHVwZGF0ZS4KCnYw
OiBSRkMgcGF0Y2ggc2V0CnYxOiBhZGRyZXNzZWQgUkZDIHJldmlldyBjb21tZW50cwp2MjogYWRk
cmVzc2VkIHYxIHJldmlldyBjb21tZW50cywgYWRkZWQgcHYgY2FsbGJhY2tzIGZvciBwdiBvcGVy
YXRpb25zCnYzOgoxLiBhZGRyZXNzZWQgdjIgcmV2aWV3IGNvbW1lbnRzLCByZW1vdmVkIHB2IGNh
bGxiYWNrcyBjb2RlIGR1cGxpY2F0aW9uIGluCnYyIGFuZCB1bmlmaWVkIHB2IGNhbGxzIHVuZGVy
IGcydiBub3RpZmljYXRpb24gcmVnaXN0ZXIuIGRpZmZlcmVudCBnMnYgcHYKbm90aWZpY2F0aW9u
cyBkZWZpbmVkLgoyLiBkcm9wcGVkIHB2IG1hc3RlciBpcnEgZmVhdHVyZSBkdWUgdG8gaGFyZCBj
b25mbGljdCB3aXRoIHJlY25ldCBpOTE1CmNoYW5nZSBhbmQgdGFrZSB0aW1lIHRvIHJld29yay4K
djQ6CjEuIGFkZHJlc3NlZCB2MyByZXZpZXcgY29tbWVudHMuCjIuIGV4dGVuZGVkIHdvcmtsb2Fk
IFBWIHN1Ym1pc3Npb24gYnkgc2tpcCBleGVjbGlzdHMgSFcgYmVoYXZpb3VyIGVtdWxhdGlvbgph
bmQgY29udGV4dCBzd2l0Y2ggaW50ZXJydXB0IGluamVjdGlvbi4gIAoKWGlhb2xpbiBaaGFuZyAo
OCk6CiAgZHJtL2k5MTU6IGludHJvZHVjZWQgdmdwdSBwdiBjYXBhYmlsaXR5CiAgZHJtL2k5MTU6
IHZncHUgc2hhcmVkIG1lbW9yeSBzZXR1cCBmb3IgcHYgb3B0aW1pemF0aW9uCiAgZHJtL2k5MTU6
IHZncHUgcHBndHQgdXBkYXRlIHB2IG9wdGltaXphdGlvbgogIGRybS9pOTE1OiB2Z3B1IGNvbnRl
eHQgc3VibWlzc2lvbiBwdiBvcHRpbWl6YXRpb24KICBkcm0vaTkxNS9ndnQ6IEdWVGcgaGFuZGxl
IHB2X2NhcHMgUFZJTkZPIHJlZ2lzdGVyCiAgZHJtL2k5MTUvZ3Z0OiBHVlRnIGhhbmRsZSBzaGFy
ZWRfcGFnZSBzZXR1cAogIGRybS9pOTE1L2d2dDogR1ZUZyBzdXBwb3J0IHBwZ3R0IHB2IG9wdGlt
aXphdGlvbgogIGRybS9pOTE1L2d2dDogR1ZUZyBzdXBwb3J0IGNvbnRleHQgc3VibWlzc2lvbiBw
diBvcHRpbWl6YXRpb24KCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZXhlY2xpc3QuYyB8ICAg
NiArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZ3R0LmMgICAgICB8IDMxNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5o
ICAgICAgfCAgIDkgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d2dC5oICAgICAgfCAgMTAg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jIHwgIDYzICsrKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC92Z3B1LmMgICAgIHwgIDMxICsrKysKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZHJ2LmggICAgIHwgICA2ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X2dlbS5jICAgICB8ICAgMyArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0
LmMgfCAgIDkgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5oIHwgICA4ICsK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcHZpbmZvLmggIHwgIDEyICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9p
OTE1X3ZncHUuYyAgICB8IDMyMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdmdwdS5oICAgIHwgIDUyICsrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaW50ZWxfbHJjLmMgICAgfCAgIDMgKwogMTUgZmlsZXMgY2hhbmdlZCwg
ODQ1IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGlu
ZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
