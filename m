Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5751058ywb;
        Wed, 27 Mar 2019 02:06:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGutm+g+vZCBUJiivcR3H/4qLanlc6OGB20JXnfwx+9NaszXbZKmt84vVgNY9jokwlQwZA
X-Received: by 2002:a17:902:2ba7:: with SMTP id l36mr36280525plb.237.1553677565631;
        Wed, 27 Mar 2019 02:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553677565; cv=none;
        d=google.com; s=arc-20160816;
        b=eSJAkYb0cxLLEjxSOEtaAdehRutLypYOYuvgRiPviRBGdcakt70lRBdftE8LqDmWIE
         s7khDl7Ohf5zHJDfoi1HhYXW/b9Cyd/giNMUy0pEQDMIDF+NP/1Lin/NXcrmJA0LQ8Ox
         917DXI89XlA0vD1mibDczJo3vAPCyeD3S1RUKe4IA/kR2ZTHkgbSEHT3KSLdDzVTDP+V
         4HitM4vIkgApwZ/40wNrxrdOmifBzk2m0sMrQlbHXEJpCPhc0JhJ8mKopFrgBKr060Xw
         aoKwJl24NO2tiXkWPVmfn4ghcoeRQS3eVnkmZLtiuHHH4qRdw6Ww8cCkQIFSiHU+rZka
         L0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:message-id:date:subject:to:from
         :delivered-to;
        bh=0wcbWOBnaPQYBM7ZF/GGSDBDTpcSjD/HiQsY0CeOwxA=;
        b=PwW6bPhAr76gT/PVH48HK5M3mhDA9lfjNEzj++YIpZZPDpgEj2Nz5H5Sc02xZAZXgb
         F6ZCqn7RLUFDIi5ruyevZ+bd/Nt9SVm9Izlw7QKmWyiTrQn1OFUh2+RyIzfhhoFIYQ/+
         xYYCk+HrMU62EWzlsks08GVfrzIp5FuuzZAvOBe50EkeFyANnFEOFoEtHKvRqrXSCgiK
         zisPtaS5HbpJgCBHYOh0PWGcvCvjpTURd/+hzR1VrXxCw/5DakgGHMWefyjV0iEis2s9
         MKurmW/M2AlxbZg8n7DwipOaO2ZwlPIqA2dr4sCjclwsGNUtELObMeDgCyVwZs3vaj+c
         24gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id u65si19071235pfj.218.2019.03.27.02.06.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 02:06:05 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D994E6E112;
	Wed, 27 Mar 2019 09:06:04 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C70D6E112;
 Wed, 27 Mar 2019 09:06:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Mar 2019 02:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,276,1549958400"; d="scan'208";a="137781394"
Received: from debian-skl.sh.intel.com ([10.239.13.15])
 by fmsmga007.fm.intel.com with ESMTP; 27 Mar 2019 02:06:01 -0700
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Disable semaphore on vGPU for now
Date: Wed, 27 Mar 2019 17:06:36 +0800
Message-Id: <20190327090636.3547-1-zhenyuw@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Kevin Tian <kevin.tian@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBpcyB0byBkaXNhYmxlIHNlbWFwaG9yZSB1c2FnZSB3aGVuIG9uIHZHUFUgZm9yIG5vdy4g
VW5mb3J0dW5hdGVseQpHVlQtZyBoYXNuJ3QgZnVsbHkgZW5hYmxlZCBzZW1hcGhvcmUgdXNhZ2Ug
eWV0LCBzbyBjdXJyZW50IGd1ZXN0IHdpdGgKc2VtYXBob3JlIHVzZSB3b3VsZCBjYXVzZSB2R1BV
IGZhaWx1cmUuCgpBbHRob3VnaCBjdXJyZW50IHNlbWFwaG9yZSBmYWlsdXJlIHdpdGggdkdQVSBj
YW4gYmUgc2ltcGx5IHJlc29sdmVkIGJ5CmFsbG93aW5nIGNtZCBwYXJzZXIgdG8gYWNjZXB0IE1J
X1NFTUFQSE9SRV9XQUlUIGNvbW1hbmQgd2l0aCBhZGRyZXNzCmF1ZGl0LCB3ZSdyZSBjaGVja2lu
ZyBnZW5lcmFsIHVzYWdlIG9mIHNlbWFwaG9yZSBhbmQgaG93IHdlIHNob3VsZApoYW5kbGUgaXQg
cHJvcGVybHkgZm9yIHZpcnR1YWxpemF0aW9uIGluIGNvbnNpZGVyIG9mIGZ1bmN0aW9uIGFuZApz
ZWN1cml0eSBjb25jZXJuLiBTbyB3ZSBkZWNpZGUgdG8gcmVxdWVzdCB0byBkaXNhYmxlIGl0IGZv
ciBub3cgaW4KZ3Vlc3QgZHJpdmVyLiBPbmNlIEdWVCBjb3VsZCBzdXBwb3J0IGl0LCB3ZSB3b3Vs
ZCBhZGQgbmV3IGNvbXBhdCBiaXQKdG8gdHVybiBpdCBvbi4KCkNjOiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpTaWduZWQtb2Zm
LWJ5OiBaaGVueXUgV2FuZyA8emhlbnl1d0BsaW51eC5pbnRlbC5jb20+Ci0tLQpOb3RlIHRoaXMg
bmVlZHMgdG8gcXVldWUgZm9yIC1uZXh0IG90aGVyd2lzZSBuZXh0IGtlcm5lbCBpOTE1IGFzIGd1
ZXN0CndvdWxkIGJlIGJyb2tlbiBmb3IgR1ZULgoKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2xyYy5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9scmMuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2xyYy5jCmluZGV4IDY2YmMzY2Q0ZTE2Ni4uNTAwNzVl
MjRhZTAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9scmMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9scmMuYwpAQCAtMjMxNSw3ICsyMzE1LDggQEAg
dm9pZCBpbnRlbF9leGVjbGlzdHNfc2V0X2RlZmF1bHRfc3VibWlzc2lvbihzdHJ1Y3QgaW50ZWxf
ZW5naW5lX2NzICplbmdpbmUpCiAJZW5naW5lLT5wYXJrID0gTlVMTDsKIAllbmdpbmUtPnVucGFy
ayA9IE5VTEw7CiAKLQllbmdpbmUtPmZsYWdzIHw9IEk5MTVfRU5HSU5FX0hBU19TRU1BUEhPUkVT
OworCWlmICghaW50ZWxfdmdwdV9hY3RpdmUoZW5naW5lLT5pOTE1KSkKKwkJZW5naW5lLT5mbGFn
cyB8PSBJOTE1X0VOR0lORV9IQVNfU0VNQVBIT1JFUzsKIAllbmdpbmUtPmZsYWdzIHw9IEk5MTVf
RU5HSU5FX1NVUFBPUlRTX1NUQVRTOwogCWlmIChlbmdpbmUtPnByZWVtcHRfY29udGV4dCkKIAkJ
ZW5naW5lLT5mbGFncyB8PSBJOTE1X0VOR0lORV9IQVNfUFJFRU1QVElPTjsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
