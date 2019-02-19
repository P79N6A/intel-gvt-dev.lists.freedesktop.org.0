Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3684675ywa;
        Tue, 19 Feb 2019 12:18:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaohMGHlvhn6lqvePJmEo+NUH0lNR5cOxD1C+DuzXsYmucPDp8XgwpRUyUZTGPNSZgeQ5yd
X-Received: by 2002:a17:902:9a84:: with SMTP id w4mr33152755plp.283.1550607530533;
        Tue, 19 Feb 2019 12:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550607530; cv=none;
        d=google.com; s=arc-20160816;
        b=zjH07arMxEqYt7mjSIk0LCHgHdMjeNGxUJGnORwU7UjO1AULMRmBzLXRBc5FApkgoR
         J7dap9ALnN8tWmdmQTdyuo3KSOoSoi0xTF991JGnL5JuOs0tXqpm5IaQUY01VgDi1Se2
         +6lb2NIERs7ZMJRUbMMREf9HAjuSe9VRPZV7G4JgWN1+KQS6OkPYCUeD5oEOuwJKSdBr
         KdTbqM+q/Sg/ECMdxtuMG1me2UeSSod013qbPQ7H4re7Hkw/xD41iz7RFaHiaXxoVVQ5
         9KlYDOzl3gDf2av4VH+NuaLwuWpDrAeE8Ji3fp6n9ax2SoEib7iqMbT2cX+1F70yAXPo
         6JKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=n/j1v4sIstw+NyGUQ7MRSOq/JJ2cFekx6MIkUKjgZOg=;
        b=ECqjqq3tyFr68mGnK4VQeoAznZjBoMwxJJYlk+sKAggf1lyq9dhKV6TrtsKAph8OLi
         liqf5p9o4piXpq8FGRKEOaLFrnE80KA20cSXQgP61YdPw+ssYGpVW+F5UcAJcWM4KQE5
         IOx+lkIGUDZk5VF5DJ/NVH0WeIe1sTrcblmZB7yVoQfFwc1kM9U/owuJYPayeFZGToy/
         PIPntc1fMVPC2IWuvR4fa9HFmW8QvhszXQzcHFc3ISh6dBSQiltoT9mYI69JsTFckdop
         ZSvgCi3pT3HHsYJZVKzni1lR4YUT/1NeCnyX0q2qxAq8v54cgGZ2UvBr3iZMo6iZODNc
         xZ0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id t11si17118162plo.293.2019.02.19.12.18.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 12:18:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1A28917E;
	Tue, 19 Feb 2019 20:18:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B82F89179
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 20:18:48 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 12:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; 
 d="txt'?scan'208,217";a="321681084"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2019 12:18:47 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 12:18:47 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 19 Feb 2019 12:18:47 -0800
Received: from [127.0.1.1] (10.239.127.40) by SHSMSX101.ccr.corp.intel.com
 (10.239.4.153) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 20 Feb
 2019 04:18:45 +0800
Content-Type: multipart/mixed; boundary="===============7538514748092749517=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <20190219072450.13827-1-yan.y.zhao@intel.com>
Subject: Patch Review for
 [PATCH_6/8]_drm/i915/gvt:_Apply_g2h_adjustment_to_buffer_start_gma_for_dmabuf
 by yan.y.zhao:PASS
Message-ID: <71de6469-4d72-4a83-99ff-6963d8354685@shsmsx101.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Wed, 20 Feb 2019 04:18:45 +0800
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

--===============7538514748092749517==
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

--===============7538514748092749517==
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

--===============7538514748092749517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============7538514748092749517==--
