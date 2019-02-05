Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp8360ywa;
        Tue, 5 Feb 2019 14:34:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYmKHxswP1x/E40Loiax9mgDhqGLHF6ZKBhiV6bSRixR3YWIRo/XCpGe+QkeRiMmTExdpHz
X-Received: by 2002:a17:902:887:: with SMTP id 7mr7418946pll.164.1549406059232;
        Tue, 05 Feb 2019 14:34:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549406059; cv=none;
        d=google.com; s=arc-20160816;
        b=FmemFJdJXf+Qo+sSBd9jT+DzIqc/H5Bp0gStD1p4dP9nLww70C+wsZl1tyP5LWnxL4
         yDCy3XLxqRoJtijWw4HY2Dtk4fhdE/skfwJoG/NVYwcN5alt6IUdHzR12SDopU55wU5O
         GiI0i3MA7TyHJxwlVPlzktx8if8n3TPO9k8ngEAutuJr50Pu4VtLD7IafMDR6Vq8I3uE
         dfmvrgiGpYcAJ8/YJ3JVOuxDPMWdxkVGYPvFMqcSJpwRKUufx19V7e7p3a89cZA6VXd2
         6uHY+0FFXtQ/EdVf1iAQHGt+CUqQ4TB0SWzSNW+A8hQKl893yeKmiKvK+WpbVfizUca9
         xV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:date:from:message-id:subject
         :in-reply-to:to:mime-version:delivered-to;
        bh=dB1MCK+qv+1XTEG0uqpUYVNF2mA0yWSlajHhaE6DgWc=;
        b=0q2n2w2Iy/c6wtuTqDrkxjfGbTyvAVzvnYA8YAm5VJIoLGF1Aeng0upDiVL+fc5u/e
         ft6LMPnXN6YMv24xNPP2SjvhhHmrM+NwqS+/3j7tfmINbDOsN2qloZkJX1rl60ZxXqcA
         jQYmPEKOjugRtpP/lnJo2+VigiaGVrIDCidE+dKUeTY7fcc7obytUZj2Pyhtv4H59ewG
         zknHNJMYz4D0K4nXirN1x5eoU0EmhRfT4sScSkJJib3LZQaOtRKSsJT9g24kM2zIMRV9
         QijoAy04Ov0+eskMD9e0m+ax8PWsEFmVFJpQLqh79XABC/3Vva9Zrn2coAxNZrV5n9qf
         tSoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id o14si3957150pgj.59.2019.02.05.14.34.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 14:34:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968189736;
	Tue,  5 Feb 2019 22:34:18 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0D189736
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue,  5 Feb 2019 22:34:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2019 14:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,337,1544515200"; 
 d="txt'?scan'208,217";a="112670784"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga007.jf.intel.com with ESMTP; 05 Feb 2019 14:34:16 -0800
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 5 Feb 2019 14:34:16 -0800
Received: from shsmsx103.ccr.corp.intel.com (10.239.4.69) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 5 Feb 2019 14:34:15 -0800
Received: from [127.0.1.1] (10.239.127.40) by SHSMSX103.ccr.corp.intel.com
 (10.239.4.69) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 6 Feb 2019
 06:34:13 +0800
Content-Type: multipart/mixed; boundary="===============8658561191986803346=="
MIME-Version: 1.0
To: <intel-gvt-dev@lists.freedesktop.org>, <fenglin.hu@intel.com>
In-Reply-To: <20190205203033.5477-1-chris@chris-wilson.co.uk>
Subject: Patch Review for
 [PATCH]_drm/i915/gvt:_Fix_kerneldoc_typo_for_intel_vgpu_emulate_hotplug by
 chris:PASS
Message-ID: <84072ab8-f089-45af-93f7-3b40d80b5263@shsmsx103.ccr.corp.intel.com>
From: <lab_gvt-test@intel.com>
Date: Wed, 6 Feb 2019 06:34:13 +0800
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

--===============8658561191986803346==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PHRpdGxlPklyaXMgUHJvIDU4MCAyMDE5LTItNjwvdGl0bGU+PC9oZWFkPjxi
b2R5PjxwPjxiPjxmb250IGZhY2U9InZlcmRhbmEiPklyaXMgUHJvIDU4MCAyMDE5LTItNjwvZm9u
dD48L2I+PC9wPjx0YWJsZSBib3JkZXI9IjAiPjx0cj48dGQgY29sc3Bhbj0iMyIgYWxpZ249ImNl
bnRlciI+PGI+VGVzdCBSZXN1bHQ8L2I+PHRkPjx0cj48dHI+PHRkIGFsaWduPSJsZWZ0Ij48Yj5U
b3RhbDogMTY8L2I+PC90ZD48dGQgYWxpZ249ImxlZnQiPjxiPjxmb250IGNvbG9yPSJncmVlbiI+
UGFzczogMTY8L2ZvbnQ+PC9iPjwvdGQ+PHRkIGFsaWduPSJsZWZ0Ij48Yj48Zm9udCBjb2xvcj0i
cmVkIj5GYWlsOiAwPC9mb250PjwvYj48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIzIiBhbGln
bj0iY2VudGVyIj48Yj5EZXRhaWwgUmVzdWx0PC9iPjx0ZD48dHI+PHRyPjx0ZCBjb2xzcGFuPSIy
Ij5WTU0gY3JlYXRlX2xpbnV4PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250
PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPlZNTSBzaHV0ZG93bl9saW51eDwvdGQ+PHRk
Pjxmb250IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFu
PSIyIj5WTU0gcmVib290X2xpbnV4PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9m
b250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPlZNTSBkZXN0cm95X2xpbnV4PC90ZD48
dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNw
YW49IjIiPlZNTSBjcmVhdGVfMl9saW51eDwvdGQ+PHRkPjxmb250IGNvbG9yPSJncmVlbiI+UEFT
UzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBjb2xzcGFuPSIyIj5WTU0gZGVzdHJveV8yX2xpbnV4
PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRk
IGNvbHNwYW49IjIiPlZNTSBjcmVhdGVfd2luMTBfNjQ8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3Jl
ZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIHNodXRkb3du
X3dpbjEwXzY0PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90
cj48dHI+PHRkIGNvbHNwYW49IjIiPlZNTSByZWJvb3Rfd2luMTBfNjQ8L3RkPjx0ZD48Zm9udCBj
b2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1N
IGRlc3Ryb3lfd2luMTBfNjQ8L3RkPjx0ZD48Zm9udCBjb2xvcj0iZ3JlZW4iPlBBU1M8L2ZvbnQ+
PC90ZD48L3RyPjx0cj48dGQgY29sc3Bhbj0iMiI+Vk1NIGNyZWF0ZV9saW51eF93aW4xMF82NDwv
dGQ+PHRkPjxmb250IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRyPjx0ZCBj
b2xzcGFuPSIyIj5WTU0gY3JlYXRlX2xpbnV4X3dpbjEwXzY0X3RvZ2V0aGVyPC90ZD48dGQ+PGZv
bnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIi
PndpbnZtX3Rlc3QgcnVuIFRyb3BpY3NfcmVib290IHdpbjEwLTY0PC90ZD48dGQ+PGZvbnQgY29s
b3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPmxpbnV4
dm1fdGVzdCAzRGdhbWVfcmVib290PC90ZD48dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9m
b250PjwvdGQ+PC90cj48dHI+PHRkIGNvbHNwYW49IjIiPndpbnZtX3Rlc3QgcnVuIFZMQyB3aW4x
MC02NDwvdGQ+PHRkPjxmb250IGNvbG9yPSJncmVlbiI+UEFTUzwvZm9udD48L3RkPjwvdHI+PHRy
Pjx0ZCBjb2xzcGFuPSIyIj53aW52bV90ZXN0IHJ1biBPQ0wyX2Jhc2ljIHdpbjEwLTY0PC90ZD48
dGQ+PGZvbnQgY29sb3I9ImdyZWVuIj5QQVNTPC9mb250PjwvdGQ+PC90cj48L3RhYmxlPjwvYm9k
eT4=

--===============8658561191986803346==
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

--===============8658561191986803346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
Cg==

--===============8658561191986803346==--
