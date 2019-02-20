Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4011467ywa;
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYhn0Lgq+t7FujpLwj0OGoFH+Rlbkva4s6vD/I1l5qHEdIMKRQQvc82P+B8P9AWngtxNdye
X-Received: by 2002:a63:6cc8:: with SMTP id h191mr26107326pgc.366.1550634692755;
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550634692; cv=none;
        d=google.com; s=arc-20160816;
        b=wirYmqbO7TGXa9K2YXhVzGefXOoA0xGNQgTqR+j/ZxxGddXYGySx72GpeA9BqBYCI1
         TkIcxzWdE+pAST9vN11EWioJjNCdiKUlesBQfJeheq+HR8+DWj7vB2bsE/3UdjD4fa+V
         eDG/REHCZl/z8AMpjC3A3U1V0JnFBSw8t9mAeLEd3rSjFwgy48OaoOH6qeLtaSgoQ3rV
         UbR8/NZZbckwjRIBqvU7LaNFGv9UNCkg38EiY0Gwf9R5omuqX3HNeT7HQkVk7uB61wej
         G+aSa3EJqXBJYUQZMV+FOsDhKD/NslxpjisdllSvdMb/dstZJtNk+Ym+kGAKhvr2AoUX
         50rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=TERfW1IrY6vjN2CcPk+um9l02IbiJYnhcIHFfy7R70U=;
        b=j/ENbiqugHsf32qlhJ8qIVs6NKNL94unlTVPyJ2+o0E7Fhf1csYV80P9pTgPYzeIH2
         ip/J36WCwIzp3gk5958Sl1bn79zRIkUUvytwT0FqUl0kRDvY9isc08nk6WK8qyjFudDo
         +3GhZd4yB3Yd9qd29fL4MtwBErgV8oNxzEl23oqgM4Znf2JuF/YJl7HZcogTQHiFw9VM
         k/7WMhf9jPt7YpRHjO4XP43JCQzeiDOIvNE5bBvav0MH8h7f4L8PZ4pffmFufVR9PTH1
         NRsFojE+PIQ6PJpouBVi4oAbGzuJX1JzalKHoGAZXExp7QQu2kUKKIdK301C1ib4OGFp
         +H6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f63si17204590pgc.473.2019.02.19.19.51.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 19:51:32 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7F4890D3;
	Wed, 20 Feb 2019 03:51:31 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5DE890D3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 03:51:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 19:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="145684602"
Received: from genxtest-ykzhao.sh.intel.com ([10.239.143.71])
 by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2019 19:51:29 -0800
From: Zhao Yakui <yakui.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gvt: Refine the snapshort range of I915
 MCHBAR to optimize gvt-g boot time
Date: Wed, 20 Feb 2019 12:07:44 +0800
Message-Id: <1550635665-30372-1-git-send-email-yakui.zhao@intel.com>
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
Cc: Zhao Yakui <yakui.zhao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

Q3VycmVudGx5IGl0IHdpbGwgdGFrZSB0aGUgc25hcHNob3Qgb2YgdGhlIE1DSEJBUiByZWdpc3Rl
cnMgZm9yIGd2dC1nCmluaXRpYWxpemF0aW9uIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgZm9yIGd1
ZXN0IHZncHUuIEFuZCBpdCB3aWxsIGNvdmVyCmZyb20gMHgxNDAwMDAgdG8gMHgxN2ZmZmYuIElu
IGZhY3QgYmFzZWQgb24gdGhlIEhXIHNwZWMgbW9zdCBvZiB0aGVtIGFyZQptZWFubGluZ2xlc3Mg
YW5kIHNvbWUgdGltZSBpcyB3YXN0ZWQgdG8gcmVhZCB0aGVzZSByZWdpc3Rlci4KT25seSB0aGUg
cmFuZ2Ugb2YgMHgxNDQwMDAgdG8gMHgxNDdmZmYgY29udGFpbnMgdGhlIHZhbGlkIGRlZmluaXRp
b24uClNvIHRoZSByYW5nZSBvZiBjYXB0dXJpbmcgSTkxNSBNQ0hCQVIgcmVnaXN0ZXIgaXMgcmVm
aW5lZCwgd2hpY2ggaGVscHMKdG8gb3B0aW1pemUgdGhlIGd2dC1nIGJvb3QgdGltZS4KClYxLT5W
MjogTW92ZSB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiBpbnRvIHJlZy5oCgpTaWduZWQtb2ZmLWJ5
OiBaaGFvIFlha3VpIDx5YWt1aS56aGFvQGludGVsLmNvbT4KQWNrZWQtYnk6IFpoZW55dSBXYW5n
IDx6aGVueXV3QGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
aGFuZGxlcnMuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9yZWcuaCAgICAgIHwg
MyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwppbmRleCBiYzY0YjgxLi5iNWMwYWMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMuYwpAQCAtMzI2NSw3ICszMjY1LDcgQEAgdm9pZCBp
bnRlbF9ndnRfY2xlYW5fbW1pb19pbmZvKHN0cnVjdCBpbnRlbF9ndnQgKmd2dCkKIC8qIFNwZWNp
YWwgTU1JTyBibG9ja3MuICovCiBzdGF0aWMgc3RydWN0IGd2dF9tbWlvX2Jsb2NrIG1taW9fYmxv
Y2tzW10gPSB7CiAJe0RfU0tMX1BMVVMsIF9NTUlPKENTUl9NTUlPX1NUQVJUX1JBTkdFKSwgMHgz
MDAwLCBOVUxMLCBOVUxMfSwKLQl7RF9BTEwsIF9NTUlPKE1DSEJBUl9NSVJST1JfQkFTRV9TTkIp
LCAweDQwMDAwLCBOVUxMLCBOVUxMfSwKKwl7RF9BTEwsIE1DSEJBUl9NSVJST1JfUkVHX0JBU0Us
IDB4NDAwMCwgTlVMTCwgTlVMTH0sCiAJe0RfQUxMLCBfTU1JTyhWR1RfUFZJTkZPX1BBR0UpLCBW
R1RfUFZJTkZPX1NJWkUsCiAJCXB2aW5mb19tbWlvX3JlYWQsIHB2aW5mb19tbWlvX3dyaXRlfSwK
IAl7RF9BTEwsIExHQ19QQUxFVFRFKFBJUEVfQSwgMCksIDEwMjQsIE5VTEwsIE5VTEx9LApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3JlZy5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L3JlZy5oCmluZGV4IDQyOGQyNTIuLjU2Y2ZmMjAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d2dC9yZWcuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
cmVnLmgKQEAgLTk1LDQgKzk1LDcgQEAKICNkZWZpbmUgUklOR19HRlhfTU9ERShiYXNlKQlfTU1J
TygoYmFzZSkgKyAweDI5YykKICNkZWZpbmUgVkZfR1VBUkRCQU5ECQlfTU1JTygweDgzYTQpCiAK
Ky8qIGRlZmluZSB0aGUgZWZmZWN0aXZlIHJhbmdlIG9mIE1DSEJBUiByZWdpc3RlciBvbiBTYW5k
eWJyaWRnZSsgKi8KKyNkZWZpbmUgTUNIQkFSX01JUlJPUl9SRUdfQkFTRQlfTU1JTyhNQ0hCQVJf
TUlSUk9SX0JBU0VfU05CICsgMHg0MDAwKQorCiAjZW5kaWYKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxp
bmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWd2dC1kZXY=
