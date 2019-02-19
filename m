Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3318349ywa;
        Tue, 19 Feb 2019 05:49:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZsGsxQjrzhuVMNFraum1EvpAKhUVW0taVejrTSNG2WVPwYMIpPAqXDYo+onoVhO2+xT2aX
X-Received: by 2002:a62:e086:: with SMTP id d6mr29678867pfm.247.1550584191863;
        Tue, 19 Feb 2019 05:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550584191; cv=none;
        d=google.com; s=arc-20160816;
        b=O4H82nkqpbRV8F/LVObjM55Bp2fHIplBxelgPHGcRo+CmeZTQ4ot7wkB5jKwitbtAu
         UDyjDUif4cVIEvn8lJm2hIFXHwzA3pKY1SDmmyWDwAm17Lq+ugx7L/ZV4Pe/HeXPXsYr
         h2qTLzIOMPxlRlVvSWZndKPwGokzJvFUrfOgs6NiYY+6v+fhsDKB4ynTijla+UoYP9iG
         9IW9aNkTkc4XobQWnJOZ7IOkS7+vd5PSkQAqR4BSuDAPkVOPgErPQ0h1dm4PrjU2258N
         EtrSTSmzKTx2gBmlGyELR4VqySvbZztca882cUg8p7s7KdIcMtYcQTDZNlUt109fq5cJ
         0Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=NqHG7bm8HBmiVorRb81iZzP0gAcix1LjGATZzk9OinI=;
        b=iTko4ulyqRaauLZw9hwdtzqiptHxTqMBCrTdgklaKh5tWRcs/SsiKutdPnToKwRRR0
         fYDiSE31RgjKDciR8w+Tqs2oAOCg8EfSsiEJQOiDJCYpW1TtaAsgOEvWMTgvBIzP29fz
         g5RSFszHT29Sr4JFu3ZXNEj4YlIh/37RsKmRUs5bLr2Usd0BhAym2ic/oYzqC9xmoJg7
         jJIoOGd4OHGa6cht/Dy9gV8gtIllgCcrV192Uskk/1Om2xohoO8xpcnPcX3r1ZsC4RqJ
         QBiy+b7yeF6g8W3e//NFOhc1NKSbghA2lO0wPUe8ChOIHrNpcTuQWfzhMFkd7POui3qz
         NhJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id r12si16328257plo.59.2019.02.19.05.49.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 05:49:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11357891D9;
	Tue, 19 Feb 2019 13:49:51 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07793891D9
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 13:49:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 05:49:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; 
 d="txt'?scan'208,217";a="125567372"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga008.fm.intel.com with ESMTP; 19 Feb 2019 05:49:48 -0800
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 05:49:48 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 05:49:47 -0800
Received: from [127.0.1.1] (10.239.127.40) by SHSMSX104.ccr.corp.intel.com
 (10.239.4.70) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 19 Feb
 2019 21:49:46 +0800
Content-Type: multipart/mixed; boundary="===============4274225486458430463=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <20190219072420.13689-1-yan.y.zhao@intel.com>
Subject: Patch Review for
 [PATCH_3/8]_drm/i915/gvt:_Patch_the_gma_in_gpu_commands_during_command_parser
 by yan.y.zhao:PASS
Message-ID: <c84a581a-3ed6-4062-a0b0-1068877c5b8f@shsmsx104.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Tue, 19 Feb 2019 21:49:46 +0800
X-Originating-IP: [10.239.127.40]
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
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============4274225486458430463==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHRpdGxlPklyaXMgUHJvIDU4MCAyMDE5LTItMjA8L3RpdGxlPjwvaGVhZD48
Ym9keT48cD48Yj48Zm9udCBmYWNlPSJ2ZXJkYW5hIj5JcmlzIFBybyA1ODAgMjAxOS0yLTIwPC9m
b250PjwvYj48L3A+PHRhYmxlIGJvcmRlcj0iMCI+PHRyPjx0ZCBjb2xzcGFuPSIzIiBhbGlnbj0i
Y2VudGVyIj48Yj5UZXN0IFJlc3VsdDwvYj48dGQ+PHRyPjx0cj48dGQgYWxpZ249ImxlZnQiPjxi
PlRvdGFsOiAxNjwvYj48L3RkPjx0ZCBhbGlnbj0ibGVmdCI+PGI+PGZvbnQgY29sb3I9ImdyZWVu
Ij5QYXNzOiAxNjwvZm9udD48L2I+PC90ZD48dGQgYWxpZ249ImxlZnQiPjxiPjxmb250IGNvbG9y
PSJyZWQiPkZhaWw6IDA8L2ZvbnQ+PC9iPjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjMiIGFs
aWduPSJjZW50ZXIiPjxiPkRldGFpbCBSZXN1bHQ8L2I+PHRkPjx0cj48dHI+PHRkIGNvbHNwYW49
IjIiPlZNTSBjcmVhdGVfbGludXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2Zv
bnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIHNodXRkb3duX2xpbnV4PC90ZD48
dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNw
YW49IjIiPlZNTSByZWJvb3RfbGludXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8
L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIGRlc3Ryb3lfbGludXg8L3Rk
Pjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29s
c3Bhbj0iMiI+Vk1NIGNyZWF0ZV8yX2xpbnV4PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5Q
QVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPlZNTSBkZXN0cm95XzJfbGlu
dXg8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48
dGQgY29sc3Bhbj0iMiI+Vk1NIGNyZWF0ZV93aW4xMF82NDwvdGQ+PHRkPjxmb250IGNvbG9yPSJn
cmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5WTU0gc2h1dGRv
d25fd2luMTBfNjQ8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48
L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIHJlYm9vdF93aW4xMF82NDwvdGQ+PHRkPjxmb250
IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5W
TU0gZGVzdHJveV93aW4xMF82NDwvdGQ+PHRkPjxmb250IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9u
dD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5WTU0gY3JlYXRlX2xpbnV4X3dpbjEwXzY0
PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRk
IGNvbHNwYW49IjIiPlZNTSBjcmVhdGVfbGludXhfd2luMTBfNjRfdG9nZXRoZXI8L3RkPjx0ZD48
Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0i
MiI+d2ludm1fdGVzdCBydW4gVHJvcGljc19yZWJvb3Qgd2luMTAtNjQ8L3RkPjx0ZD48Zm9udCBj
b2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+bGlu
dXh2bV90ZXN0IDNEZ2FtZV9yZWJvb3Q8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8
L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+d2ludm1fdGVzdCBydW4gVkxDIHdp
bjEwLTY0PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48
dHI+PHRkIGNvbHNwYW49IjIiPndpbnZtX3Rlc3QgcnVuIE9DTDJfYmFzaWMgd2luMTAtNjQ8L3Rk
Pjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjwvdGFibGU+PC9i
b2R5Pg==

--===============4274225486458430463==
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="hwinfo.txt"

SGFyZHdhcmUgSW5mb3JtYXRpb24NCglCb3JhZA0KCQlOYW1lCQk6IFNreWxha2UgSGFsbyBERFI0
IFJWUDExDQoJCVZlcnNpb24JOiAxDQoJQ1BVDQoJCU5hbWUJCTogR2VudWluZSBJbnRlbChSKSBD
UFUgMDAwMCBAIDEuNjBHSHoNCgkJTWF4IFNwZWVkCTogODMwMCBNSHoNCgkJQ29yZSBFbmFibGVk
OiA0DQoJCVRocmVhZCBDb3VudDogOA0KCU1lbW9yeQ0KCQlTbG90CQk6IDINCgkJU2l6ZQkJOiA4
MTkyIE1COyA4MTkyIE1CDQoJCVR5cGUJCTogRERSNDsgRERSNA0KCQlTcGVlZAkJOiAyMTMzIE1U
L3M7IDIxMzMgTVQvcw0KCUJJT1MKDQoJCVZlcnNpb24JOiBTS0xTRTJSMS5SMDAuQjA5NS5CMDIu
MTUwODE5MTY1NQ0KCVZHQQoNCgkJTmFtZQkJOiBJcmlzIFBybyA1ODANCgkJUmV2CQk6IDA1DQoJ
CVBDSSBJRAk6IDE5M2INCgoNCg==

--===============4274225486458430463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============4274225486458430463==--
