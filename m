Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1055457ywe;
        Thu, 21 Feb 2019 21:49:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib/x710l0fjiJmluYsN6XhkD7QpjxpZhJGypVuHiP9I103vLBL2NC8jkWX4Ko+Abs6qyKRB
X-Received: by 2002:a17:902:28c1:: with SMTP id f59mr2476546plb.37.1550814587009;
        Thu, 21 Feb 2019 21:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550814587; cv=none;
        d=google.com; s=arc-20160816;
        b=SErYc2rCMZjDcOU1j/Sxv+qAc0Ni3lD67ZGkaIjY9hRKVOrsz3j1Of8c/Pbw67UbJy
         ebLgG/pKlsaMA6bTbsNuOYBsWmq7FBFq4MaC2ZDnO9Fn0EnqCvnaPS1KVGbEVUyuhklU
         KcflPhWXOhE/UlcrFMfc5PGUyhWl1sIGbe+/q2mg25jQrb9K01+ZJutB4FvIfHVdQPAE
         8ZUcwUGUD/nfZI80vRqcRvIYWedVaP7ADCdODupiZyUz4IMy5C3UyHPLN2JRnKfL9slB
         jCG0UFKfxmgjyE0rGDLu5dwQ5wZvwzxtL3I4bsDMuxG7WD3fIM9kfCgVJLPNaaKkdl2B
         f3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=0hEUQNV9o0ToKNDTXkH+OOQ69FpGndbE0nIfzJduDds=;
        b=c71btODll/AlUvyQPFvms30tcVf5DyZu8K4IVOp7Qjdhh1vM08kOYqzS2XWad94WSv
         037O1hqcj05RuNCev4Ze+5FZ2S7JpKLU7gArPs16WyUx38PqYrVyfLN/fj2eGGybeL4K
         Ksd0Ho2ogbhscW8d5/wGT3pV4YvnVEiVvAEFndPeq8hU+QtVmZKntyaIK6BZ2itI2im3
         fgP+civ0Sotowp96taWcaCkccir+qe0Z69FCFM2eHsTmxCxCv3S4L8YstPULqcpTozQh
         QP0yYFvRLqdQLhBrhHsPC4yUTvXR6slri1IkrdJHm9Z9SNO6KuXHD+7JGUyUHEV4oCFx
         fQCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id d23si551435pfm.181.2019.02.21.21.49.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Feb 2019 21:49:46 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B11E89296;
	Fri, 22 Feb 2019 05:49:46 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5192889289
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 05:49:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E50673082E02;
 Fri, 22 Feb 2019 05:49:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6D316E55;
 Fri, 22 Feb 2019 05:49:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8D2FF11AB7; Fri, 22 Feb 2019 06:49:39 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] vfio/display: add xres + yres properties
Date: Fri, 22 Feb 2019 06:49:38 +0100
Message-Id: <20190222054939.19739-3-kraxel@redhat.com>
In-Reply-To: <20190222054939.19739-1-kraxel@redhat.com>
References: <20190222054939.19739-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 22 Feb 2019 05:49:44 +0000 (UTC)
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBhbGxvd3MgY29uZmlndXJlIHRoZSBkaXNwbGF5IHJlc29sdXRpb24gd2hpY2ggdGhlIHZn
cHUgc2hvdWxkIHVzZS4KVGhlIGluZm9ybWF0aW9uIHdpbGwgYmUgcGFzc2VkIHRvIHRoZSBndWVz
dCB1c2luZyBFRElELCBzbyB0aGUgbWRldgpkcml2ZXIgbXVzdCBzdXBwb3J0IHRoZSB2ZmlvIGVk
aWQgcmVnaW9uIGZvciB0aGlzIHRvIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KLS0tCiBody92ZmlvL3BjaS5oICAgICB8ICAyICsrCiBody92
ZmlvL2Rpc3BsYXkuYyB8IDEyICsrKysrKysrKystLQogaHcvdmZpby9wY2kuYyAgICAgfCAxMiAr
KysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5oIGIvaHcvdmZpby9wY2kuaAppbmRleCBi
MWFlNGMwNzU0OWEuLmMxMWMzZjE2NzA3MCAxMDA2NDQKLS0tIGEvaHcvdmZpby9wY2kuaAorKysg
Yi9ody92ZmlvL3BjaS5oCkBAIC0xNDksNiArMTQ5LDggQEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT1BD
SURldmljZSB7CiAjZGVmaW5lIFZGSU9fRkVBVFVSRV9FTkFCTEVfSUdEX09QUkVHSU9OIFwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDEgPDwgVkZJT19GRUFUVVJFX0VOQUJMRV9J
R0RfT1BSRUdJT05fQklUKQogICAgIE9uT2ZmQXV0byBkaXNwbGF5OworICAgIHVpbnQzMl90IGRp
c3BsYXlfeHJlczsKKyAgICB1aW50MzJfdCBkaXNwbGF5X3lyZXM7CiAgICAgaW50MzJfdCBib290
aW5kZXg7CiAgICAgdWludDMyX3QgaWdkX2dtczsKICAgICBPZmZBdXRvUENJQkFSIG1zaXhfcmVs
bzsKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vZGlzcGxheS5jIGIvaHcvdmZpby9kaXNwbGF5LmMKaW5k
ZXggZjU5ZmNjNDg3MTI4Li44YmY3Yzg5MGJlOTYgMTAwNjQ0Ci0tLSBhL2h3L3ZmaW8vZGlzcGxh
eS5jCisrKyBiL2h3L3ZmaW8vZGlzcGxheS5jCkBAIC00Niw4ICs0Niw4IEBAIHN0YXRpYyB2b2lk
IHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZShWRklPUENJRGV2aWNlICp2ZGV2LCBib29sIGVuYWJs
ZWQsCiAgICAgcWVtdV9lZGlkX2luZm8gZWRpZCA9IHsKICAgICAgICAgLm1heHggID0gZHB5LT5l
ZGlkX3JlZ3MtPm1heF94cmVzLAogICAgICAgICAubWF4eSAgPSBkcHktPmVkaWRfcmVncy0+bWF4
X3lyZXMsCi0gICAgICAgIC5wcmVmeCA9IHByZWZ4LAotICAgICAgICAucHJlZnkgPSBwcmVmeSwK
KyAgICAgICAgLnByZWZ4ID0gcHJlZnggPzogdmRldi0+ZGlzcGxheV94cmVzLAorICAgICAgICAu
cHJlZnkgPSBwcmVmeSA/OiB2ZGV2LT5kaXNwbGF5X3lyZXMsCiAgICAgfTsKIAogICAgIGRweS0+
ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RBVEVfRE9XTjsK
QEAgLTEyOCw2ICsxMjgsMTQgQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2VkaWRfaW5pdChW
RklPUENJRGV2aWNlICp2ZGV2KQogICAgIHByZWFkX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywg
ZHB5LT5lZGlkX3JlZ3MsIG1heF95cmVzKTsKICAgICBkcHktPmVkaWRfYmxvYiA9IGdfbWFsbG9j
MChkcHktPmVkaWRfcmVncy0+ZWRpZF9tYXhfc2l6ZSk7CiAKKyAgICAvKiBpZiB4cmVzICsgeXJl
cyBwcm9wZXJ0aWVzIGFyZSB1bnNldCB1c2UgdGhlIG1heGltdW0gcmVzb2x1dGlvbiAqLworICAg
IGlmICghdmRldi0+ZGlzcGxheV94cmVzKSB7CisgICAgICAgIHZkZXYtPmRpc3BsYXlfeHJlcyA9
IGRweS0+ZWRpZF9yZWdzLT5tYXhfeHJlczsKKyAgICB9CisgICAgaWYgKCF2ZGV2LT5kaXNwbGF5
X3lyZXMpIHsKKyAgICAgICAgdmRldi0+ZGlzcGxheV95cmVzID0gZHB5LT5lZGlkX3JlZ3MtPm1h
eF95cmVzOworICAgIH0KKwogICAgIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZSh2ZGV2LCB0cnVl
LCAwLCAwKTsKICAgICByZXR1cm47CiAKZGlmZiAtLWdpdCBhL2h3L3ZmaW8vcGNpLmMgYi9ody92
ZmlvL3BjaS5jCmluZGV4IGRkMTJmMzYzOTE1ZC4uNTA0MDE5YzQ1ODJiIDEwMDY0NAotLS0gYS9o
dy92ZmlvL3BjaS5jCisrKyBiL2h3L3ZmaW8vcGNpLmMKQEAgLTMwNjgsNiArMzA2OCwxNiBAQCBz
dGF0aWMgdm9pZCB2ZmlvX3JlYWxpemUoUENJRGV2aWNlICpwZGV2LCBFcnJvciAqKmVycnApCiAg
ICAgICAgIGVycm9yX3NldGcoZXJycCwgInJhbWZiPW9uIHJlcXVpcmVzIGRpc3BsYXk9b24iKTsK
ICAgICAgICAgZ290byBvdXRfdGVhcmRvd247CiAgICAgfQorICAgIGlmICh2ZGV2LT5kaXNwbGF5
X3hyZXMgfHwgdmRldi0+ZGlzcGxheV95cmVzKSB7CisgICAgICAgIGlmICh2ZGV2LT5kcHkgPT0g
TlVMTCkgeworICAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAieHJlcyBhbmQgeXJlcyBwcm9w
ZXJ0aWVzIHJlcXVpcmUgZGlzcGxheT1vbiIpOworICAgICAgICAgICAgZ290byBvdXRfdGVhcmRv
d247CisgICAgICAgIH0KKyAgICAgICAgaWYgKHZkZXYtPmRweS0+ZWRpZF9yZWdzID09IE5VTEwp
IHsKKyAgICAgICAgICAgIGVycm9yX3NldGcoZXJycCwgInhyZXMgYW5kIHlyZXMgcHJvcGVydGll
cyBuZWVkIGVkaWQgc3VwcG9ydCIpOworICAgICAgICAgICAgZ290byBvdXRfdGVhcmRvd247Cisg
ICAgICAgIH0KKyAgICB9CiAKICAgICB2ZmlvX3JlZ2lzdGVyX2Vycl9ub3RpZmllcih2ZGV2KTsK
ICAgICB2ZmlvX3JlZ2lzdGVyX3JlcV9ub3RpZmllcih2ZGV2KTsKQEAgLTMxODIsNiArMzE5Miw4
IEBAIHN0YXRpYyBQcm9wZXJ0eSB2ZmlvX3BjaV9kZXZfcHJvcGVydGllc1tdID0gewogICAgIERF
RklORV9QUk9QX1NUUklORygic3lzZnNkZXYiLCBWRklPUENJRGV2aWNlLCB2YmFzZWRldi5zeXNm
c2RldiksCiAgICAgREVGSU5FX1BST1BfT05fT0ZGX0FVVE8oImRpc3BsYXkiLCBWRklPUENJRGV2
aWNlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc3BsYXksIE9OX09GRl9BVVRPX09G
RiksCisgICAgREVGSU5FX1BST1BfVUlOVDMyKCJ4cmVzIiwgVkZJT1BDSURldmljZSwgZGlzcGxh
eV94cmVzLCAwKSwKKyAgICBERUZJTkVfUFJPUF9VSU5UMzIoInlyZXMiLCBWRklPUENJRGV2aWNl
LCBkaXNwbGF5X3lyZXMsIDApLAogICAgIERFRklORV9QUk9QX1VJTlQzMigieC1pbnR4LW1tYXAt
dGltZW91dC1tcyIsIFZGSU9QQ0lEZXZpY2UsCiAgICAgICAgICAgICAgICAgICAgICAgIGludHgu
bW1hcF90aW1lb3V0LCAxMTAwKSwKICAgICBERUZJTkVfUFJPUF9CSVQoIngtdmdhIiwgVkZJT1BD
SURldmljZSwgZmVhdHVyZXMsCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
