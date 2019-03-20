Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5a0b:0:0:0:0:0 with SMTP id o11csp212852ywb;
        Tue, 19 Mar 2019 20:21:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuYY4DH9UmUfss5RTBmC1B/ZLS3cpUUGb5mxEkCvOUGm1bNhFcffiNJwao5IjS23nq/rmt
X-Received: by 2002:aa7:8243:: with SMTP id e3mr5890115pfn.40.1553052098280;
        Tue, 19 Mar 2019 20:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553052098; cv=none;
        d=google.com; s=arc-20160816;
        b=ItdDREPskdpPynAXKHNLFztDAELJtBbLo8qC7BvgiloToP11f55R/dT6rQ7aIOz4zc
         d+uL63CHV2VGOFyUjED+5+JbIJe0NM17htBa3JXYzW+e960XCZ5HnHbhZ+QAyUuqVoEa
         ST4Y3ugVYCyqfr/pstwqKvWAguUPHDmir4i5a6LcqBUaKS0PvYy53ND0JGKe7X+bsZYn
         Sz8rvvlzaIcEs2Qvx56iZMzSRNr16G6pAEZuWQ44ooE895/uCDQ92hSsEDK4lFSHR0kZ
         pkJDzzsXppFsVqMGMYWWD/2IXD9p5twSz6aldd3Dd3u7iuQHC3++2E62PMZxMICJgqvS
         bMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=zPdYQgLWMsVP0zN/GRPEkjj+f7F/etLu09Uux5kZFdY=;
        b=v1ReFijlfhLpAjc561VlmM5fI6/wpQanNyHM/d+Y8C3cZlfFIl30J30Ci+zaZ+kzZI
         vH66CMHCfLLTJ/t0gJjAZlxkRgnyMnC+nCve5jIJduVljfitX/DFGEz8b8xODexdVx2E
         Ly/m2ZlxBi+w1uRwgIDmBrA00lYdmy0ZZOWBtxiGMNeHaut5Lg1FXmgrU7pSODVpjZn3
         3lEGFQ8zOmN3nJjqjVSzblw7QU/t7AVLK7XdFBhZU1KpqZqNc8ZNsu6M3OaBwDiAd/B2
         BBveLaySzubVlrCc/mYtc4ciCamkwtyIUpdfB3i2ZngWakREBnxv45+Nprieig/X1uL3
         c/7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 34si797614plz.256.2019.03.19.20.21.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2019 20:21:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EDC89861;
	Wed, 20 Mar 2019 03:21:37 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53489861
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Mar 2019 03:21:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2019 20:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,246,1549958400"; d="scan'208";a="215707315"
Received: from coxu-arch-shz.sh.intel.com ([10.239.160.25])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2019 20:21:34 -0700
From: Colin Xu <colin.xu@intel.com>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915/gvt: Fix klocwork criticals and errors
Date: Wed, 20 Mar 2019 11:21:24 +0800
Message-Id: <20190320032130.9817-1-colin.xu@intel.com>
X-Mailer: git-send-email 2.21.0
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

Rml4IHBvdGVudGlhbCBhcnJheSBpbmRleCBvdmVyZmxvdyBhbmQgaW52YWxpZCBwb2ludGVyIGFj
Y2Vzcy4KQWx0aG91Z2ggdGhlc2UgYWNjZXNzIGFyZSBwcm90ZWN0ZWQgYnkgY3VycmVudCBndnQg
bG9naWMgYW5kIHdvbid0IGhpdApkdXJpbmcgcnVubmluZywgYnV0IHN0aWxsIGhhcyBwb3RlbnRp
YWwgc2VjdXJpdHkgcmlzayBpbiBmdXR1cmUuCgoxMTU0OiBQb2ludGVyICdpbnRlbF9jb250ZXh0
X2xvb2t1cChzLT5zaGFkb3dfY3R4LCBkZXZfcHJpdi0+ZW5naW5lW3JpbmdfaWRdKScKcmV0dXJu
ZWQgZnJvbSBjYWxsIHRvIGZ1bmN0aW9uICdpbnRlbF9jb250ZXh0X2xvb2t1cCcgYXQgbGluZSA0
OTkgbWF5IGJlIE5VTEwgCmFuZCB3aWxsIGJlIGRlcmVmZXJlbmNlZCBhdCBsaW5lIDQ5OS4KZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jOjQ5OSB8IHN3aXRjaF9tbWlvKCkK
Q29kZTogTlBELkZVTkMuTVVTVCB8IFNldmVyaXR5OiBDcml0aWNhbCgxKQoKMTM2OTogT3BlcmFu
ZHMgaW4gYSBiaXR3aXNlIG9wZXJhdGlvbiBoYXZlIGRpZmZlcmVudCBzaXplCmRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jOjM0NCB8IGdkcnN0X21taW9fd3JpdGUoKQpTbWFydFJh
bmsgUmVjb21tZW5kZWQgfCBDb2RlOiBDV0FSTi5CSVRPUC5TSVpFCgoxNDMxOiAnZmJfaW5mby5v
YmonIGlzIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uLgpkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZG1hYnVmLmM6NDI1IHwgaW50ZWxfdmdwdV9xdWVyeV9wbGFuZSgpCkNvZGU6
IFVOSU5JVC5TVEFDSy5NVVNUIHwgU2V2ZXJpdHk6IENyaXRpY2FsKDEpCgoxNDMyOiBBcnJheSAn
c2NyYXRjaF9wdCcgb2Ygc2l6ZSAxNyBtYXkgdXNlIGluZGV4IHZhbHVlKHMpIDE3LgpBbHNvIHRo
ZXJlIGlzIG9uZSBzaW1pbGFyIGVycm9yIG9uIGxpbmUgOTY1Lgpkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmM6OTY1IHwgcHBndHRfaW52YWxpZGF0ZV9wdGUoKQpDb2RlOiBBQlYuR0VORVJB
TCB8IFNldmVyaXR5OiBDcml0aWNhbCgxKQoKMTQzMzogJ3JlZ3MnIGFycmF5IGVsZW1lbnRzIGFy
ZSB1c2VkIHVuaW5pdGlhbGl6ZWQgaW4gdGhpcyBmdW5jdGlvbiB3aXRoCmluZGV4IHJhbmdlOiBb
NCw1XS4KZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L21taW9fY29udGV4dC5jOjM0OSB8IGhhbmRs
ZV90bGJfcGVuZGluZ19ldmVudCgpCkNvZGU6IFVOSU5JVC5TVEFDSy5BUlJBWS5QQVJUSUFMLk1V
U1QgfCBTZXZlcml0eTogQ3JpdGljYWwoMSkKCjE0MzQ6IE9wZXJhbmRzIGluIGEgYml0d2lzZSBv
cGVyYXRpb24gaGF2ZSBkaWZmZXJlbnQgc2l6ZQpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVi
dWdmcy5jOjE3MiB8IHZncHVfc2Nhbl9ub25wcml2YmJfc2V0KCkKQ29kZTogQ1dBUk4uQklUT1Au
U0laRSB8IFNldmVyaXR5OiBSZXZpZXcoNCkKCjE0MzU6ICdyZWdzJyBhcnJheSBlbGVtZW50cyBh
cmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gd2l0aAppbmRleCByYW5nZTog
WzQsNV0uCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9tbWlvX2NvbnRleHQuYzoxNjUgfCBsb2Fk
X3JlbmRlcl9tb2NzKCkKQ29kZTogVU5JTklULlNUQUNLLkFSUkFZLlBBUlRJQUwuTVVTVCB8IFNl
dmVyaXR5OiBDcml0aWNhbCgxKQoKMTQzNjogQXJyYXkgJ3ZncHUtPmZlbmNlLnJlZ3MnIG9mIHNp
emUgMzIgbWF5IHVzZSBpbmRleCB2YWx1ZShzKSAzMi4uSU5UX01BWApkcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndnQvYXBlcnR1cmVfZ20uYzoxNTkgfCBfY2xlYXJfdmdwdV9mZW5jZSgpCkNvZGU6IEFC
Vi5TVEFDSyB8IFNldmVyaXR5OiBDcml0aWNhbCgxKQoKMTQzNzogQXJyYXkgJ25hbWUnIG9mIHNp
emUgMTAgbWF5IHVzZSBpbmRleCB2YWx1ZShzKSAxMC4uMTUKZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z3Z0L2RlYnVnZnMuYzoyMDEgfCBpbnRlbF9ndnRfZGVidWdmc19hZGRfdmdwdSgpCkNvZGU6IEFC
Vi5HRU5FUkFMIHwgU2V2ZXJpdHk6IENyaXRpY2FsKDEpCgoxNDM4OiBBcnJheSAnc2NyYXRjaF9w
dCcgb2Ygc2l6ZSAxNyBtYXkgdXNlIGluZGV4IHZhbHVlKHMpIDE3LgpBbHNvIHRoZXJlIGlzIG9u
ZSBzaW1pbGFyIGVycm9yIG9uIGxpbmUgMTcyMS4KZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0
dC5jOjE3MjEgfCBwcGd0dF9oYW5kbGVfZ3Vlc3Rfd3JpdGVfcGFnZV90YWJsZV9ieXRlcygpCkNv
ZGU6IEFCVi5HRU5FUkFMIHwgU2V2ZXJpdHk6IENyaXRpY2FsKDEpCgoxNDM5OiBPYmplY3QgJ3Nw
dCcgd2FzIHVzZWQgYXQgbGluZSAxMDk1IGFmdGVyIGJlaW5nIGZyZWVkIGJ5IGNhbGxpbmcgCidw
cGd0dF9mcmVlX3NwdCcgYXQgbGluZSAxMDkzCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQu
YzoxMDk1IHwgcHBndHRfcG9wdWxhdGVfc3B0X2J5X2d1ZXN0X2VudHJ5KCkKQ29kZTogVUZNLlVT
RS5NSUdIVCB8IFNldmVyaXR5OiBFcnJvcigyKQoKMTQ0MDogQXJyYXkgJ3NjcmF0Y2hfcHQnIG9m
IHNpemUgMTcgbWF5IHVzZSBpbmRleCB2YWx1ZShzKSAxNy4KQWxzbyB0aGVyZSBhcmUgNSBzaW1p
bGFyIGVycm9ycyBvbiBsaW5lcyAxNjAyLCAxNjA5LCAxNjEzLgpkcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndnQvZ3R0LmM6MTYwMiB8IHBwZ3R0X2hhbmRsZV9ndWVzdF93cml0ZV9wYWdlX3RhYmxlKCkK
Q29kZTogQUJWLkdFTkVSQUwgfCBTZXZlcml0eTogQ3JpdGljYWwoMSkKCjE0NDE6IE9wZXJhbmRz
IGluIGEgYml0d2lzZSBvcGVyYXRpb24gaGF2ZSBkaWZmZXJlbnQgc2l6ZQpkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvZGVidWdmcy5jOjE1MCB8IHZncHVfc2Nhbl9ub25wcml2YmJfc2V0KCkKQ29k
ZTogQ1dBUk4uQklUT1AuU0laRSB8IFNldmVyaXR5OiBSZXZpZXcoNCkKCjE0NDI6IEFycmF5ICdz
Y3JhdGNoX3B0JyBvZiBzaXplIDE3IG1heSB1c2UgaW5kZXggdmFsdWUocykgLTEKZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L2d0dC5jOjk0MSB8IHBwZ3R0X2ludmFsaWRhdGVfc3B0X2J5X3NoYWRv
d19lbnRyeSgpCkNvZGU6IEFCVi5HRU5FUkFMIHwgU2V2ZXJpdHk6IENyaXRpY2FsKDEpCgoxNDQz
OiAncmVncycgYXJyYXkgZWxlbWVudHMgYXJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1
bmN0aW9uIHdpdGgKaW5kZXggcmFuZ2U6IFs0LDVdLgpkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
bW1pb19jb250ZXh0LmM6NDA0IHwgc3dpdGNoX21vY3MoKQpDb2RlOiBVTklOSVQuU1RBQ0suQVJS
QVkuUEFSVElBTC5NVVNUIHwgU2V2ZXJpdHk6IENyaXRpY2FsKDEpCgpDb2xpbiBYdSAoNik6CiAg
ZHJtL2k5MTUvZ3Z0OiBQcmV2ZW50IGludmFsaWQgYXJyYXkgaW5kZXggYWNjZXNzIHRvIHZncHUt
PmZlbmNlLnJlZ3NbXQogIGRybS9pOTE1L2d2dDogUHJldmVudCBpbnZhbGlkIHJpbmdfaWQgYWNj
ZXNzIHRvIGFycmF5IHJlZ3NbXQogIGRybS9pOTE1L2d2dDogUHJldmVudCBpbnZhbGlkIGluZGV4
IGFjY2VzcyB0byB2Z3B1LT5ndHQuc2NyYXRjaF9wdFtdCiAgZHJtL2k5MTUvZ3Z0OiBQcmV2ZW50
IHVzZSBvZiB1bmluaXRpbGl6ZWQgbWVtYmVyIGZiX2luZm8tPm9iagogIGRybS9pOTE1L2d2dDog
RXhwbGljaXQgY2FzdCBpbnQgdG8gdTY0IGFuZCBwcmV2ZW50IGNoYXIgYnVmIG92ZXJmbG93Lgog
IGRybS9pOTE1L2d2dDogRXhwbGljaXQgY2FzdCB0byBzYW1lIHR5cGUgc2l6ZSBiZWZvcmUgYml0
d2lzZQogICAgb3BlcmF0aW9uLgoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9hcGVydHVyZV9n
bS5jICB8ICAzICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZGVidWdmcy5jICAgICAgfCAg
NiArLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyAgICAgICB8ICAxICsKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuYyAgICAgICAgICB8IDUwICsrKysrKysrKysrKysr
KysrKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5kbGVycy5jICAgICB8ICAz
ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbW1pb19jb250ZXh0LmMgfCAyMiArKysrKysr
Ky0tLQogNiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkK
Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ3Z0LWRldg==
