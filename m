Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2095986ywo;
        Sun, 14 Apr 2019 19:30:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwH/PFiwt69HOanclgkrm12Fh3sRYIrZUwdLUtnpGqC67AciYWddzzTuPmk04Gh02V+rHHm
X-Received: by 2002:a65:4302:: with SMTP id j2mr64235073pgq.291.1555295420537;
        Sun, 14 Apr 2019 19:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555295420; cv=none;
        d=google.com; s=arc-20160816;
        b=XT2kZk8Whyq1rgNCFz4Gt/8sx9rSp+QMd0ckqK3zsjwp7Cbw7IGRitLTyLzb/ti1Ka
         zgDPcv2wouDSvKyxqyona9PnpB+EIQAvbtQ92hYufdqk3jL51xxerq/lWSQRJ3cE4mTd
         so9wWOQczNBKcQ5n28lOd/paBB/XHcu9HckrpkKDJRJ3QOpnIdOf/LMES9649glD3CGM
         vE+X8PUnTEqGttHqlq+ZSHWldPW/66Lpu5iY4mjLf5ZhYADFiEimUmbBLRByZnzPqHaz
         KvYVvgwEmMFUWbSa0XsFd2XNu4ypLs7sa+gvNxWpk9j44iNIG2Z7B+rQ9L5LNS9E+1P4
         jWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:dlp-reaction
         :dlp-version:dlp-product:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:delivered-to;
        bh=yh9V4dR9jfZukxzRq81AYgnPTCS58oPoFtbEk4PShx8=;
        b=ocPOAFmhfGzGtLkhvXhT4esEmUw9Jxn3haUMMaW2VyxH2zfyXPkxkXw/gEu2nZsAjJ
         BUp09lNpVF4b0sk2GHqCp9Vbeb2vgAwF5gYgzY55blP+QzFSFR/GFshkw+yzB8jhuSzK
         pr+qGNOygNtkh1YMqmFuBZ087ChIOhHKb7U+r9k33fMKh+iEX610PkqTIC5Uy19cuLDc
         eRUAlkhofPpcI/kJBYzGcjjN3wAVjinYAqIig7NUUwR32gQSygnNXkusv5iEOVgpA3oh
         MJeqqWKCG/+DRNTaC+VrXZrnDdIGhWytUOpn5R558dJG/iTQS5semRKHISOtkuCMwAvv
         pJkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id v1si41971199pgc.492.2019.04.14.19.30.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2019 19:30:20 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF998915F;
	Mon, 15 Apr 2019 02:30:19 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00908915F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 15 Apr 2019 02:30:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Apr 2019 19:30:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,351,1549958400"; 
 d="scan'208,217";a="142744647"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2019 19:30:16 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 14 Apr 2019 19:30:14 -0700
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Sun, 14 Apr 2019 19:30:10 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.92]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.25]) with mapi id 14.03.0415.000;
 Mon, 15 Apr 2019 10:30:08 +0800
From: "Yuan, Hang" <hang.yuan@intel.com>
To: "He, Yu" <yu.he@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, "Gimbitskii, Aleksei"
 <aleksei.gimbitskii@intel.com>
Subject: RE: e70f0422f03c build failure
Thread-Topic: e70f0422f03c build failure
Thread-Index: AdTt6E+ItL3PVH7zQF6YFRR650+0rgAABPrAAAAhrAABUoli4A==
Date: Mon, 15 Apr 2019 02:30:08 +0000
Message-ID: <C294FBAE55175941838A8D362DCD8AA225ED29C7@SHSMSX104.ccr.corp.intel.com>
References: <C685DB2BCFE2AF4CBCFD71F9FE83E12532918FBA@SHSMSX104.ccr.corp.intel.com>
 <EE92950F97EE42469CA4F508D4691F5E3CF4D3FC@SHSMSX104.ccr.corp.intel.com>
 <C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDE@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <C685DB2BCFE2AF4CBCFD71F9FE83E12532918FDE@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTA2OTk5OTAtZTQ2YS00YmZjLThkNTAtYTcxNTc5OWQ5MGJhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMXBpd0Y1MjRoWGgrYktrSjhmbDFmSFk2XC80dEpWM0N6bnRzSUREU3hOT3JTb1YzWEV1MGpqYURZS3liQkdPV3oifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
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
Cc: "Xu, Terrence" <terrence.xu@intel.com>
Content-Type: multipart/mixed; boundary="===============1577473762=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============1577473762==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C294FBAE55175941838A8D362DCD8AA225ED29C7SHSMSX104ccrcor_"

--_000_C294FBAE55175941838A8D362DCD8AA225ED29C7SHSMSX104ccrcor_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

TG9vcCBBbGVrc2VpIHRvIHJlYmFzZSBoaXMgcGF0Y2guDQoNCkZyb206IGludGVsLWd2dC1kZXYg
W21haWx0bzppbnRlbC1ndnQtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBC
ZWhhbGYgT2YgSGUsIFl1DQpTZW50OiBNb25kYXksIEFwcmlsIDgsIDIwMTkgNDo1NyBQTQ0KVG86
IGludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWHUsIFRlcnJlbmNlIDx0
ZXJyZW5jZS54dUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSRTogZTcwZjA0MjJmMDNjIGJ1aWxkIGZh
aWx1cmUNCg0KUGxlYXNlIGhlbHAgdG8gY2hlY2ssIHRoYW5rcyENCg0KDQoNCkJlc3QgcmVnYXJk
cywNCkhlLFl1DQoNCkZyb206IFh1LCBUZXJyZW5jZQ0KU2VudDogMjAxOcTqNNTCOMjVIDE2OjUz
DQpUbzogSGUsIFl1IDx5dS5oZUBpbnRlbC5jb208bWFpbHRvOnl1LmhlQGludGVsLmNvbT4+DQpT
dWJqZWN0OiBSRTogZTcwZjA0MjJmMDNjIGJ1aWxkIGZhaWx1cmUNCg0KztK5wLzGysdwYXRjaNC0
tcSyu7nmt7ajrMO709DNqLn91+7QwrXEZ3Z0LXN0YWdpbmfAtNC0tvi1vNbCoaMgOikNCg0Kv8nS
1Neqt6K4+FNTUCBQUkMgVkdUIFNIIDxzc3AucHJjLnZndC5zaEBpbnRlbC5jb208bWFpbHRvOnNz
cC5wcmMudmd0LnNoQGludGVsLmNvbT4+OyBTU1AgUFJDIFZHVCBCSiBzc3AucHJjLnZndC5iakBp
bnRlbC5jb208bWFpbHRvOnNzcC5wcmMudmd0LmJqQGludGVsLmNvbT6/tL+0DQpGcm9tOiBIZSwg
WXUNClNlbnQ6IE1vbmRheSwgQXByaWwgOCwgMjAxOSA0OjUyIFBNDQpUbzogWHUsIFRlcnJlbmNl
IDx0ZXJyZW5jZS54dUBpbnRlbC5jb208bWFpbHRvOnRlcnJlbmNlLnh1QGludGVsLmNvbT4+DQpT
dWJqZWN0OiBlNzBmMDQyMmYwM2MgYnVpbGQgZmFpbHVyZQ0KDQoNCktlcm5lbCBidWlsZCBmYWls
dXJlOg0KDQoNCg0KDQoNCisgNzNkN2RkMGM0NTI3Li4uZTcwZjA0MjJmMDNjIGd2dC1zdGFnaW5n
IC0+IG9yaWdpbi9ndnQtc3RhZ2luZyAgKGZvcmNlZCB1cGRhdGUpDQoNCiAqIFtuZXcgdGFnXSAg
ICAgICAgICAgICAgICAgICBndnQtc3RhZ2luZy0yMDE5eS0wNG0tMDhkLTEwaC01M20tMzBzIC0+
IGd2dC1zdGFnaW5nLTIwMTl5LTA0bS0wOGQtMTBoLTUzbS0zMHMNCg0KSEVBRCBpcyBub3cgYXQg
ZTcwZjA0MjJmMDNjIGd2dC1zdGFnaW5nOiAyMDE5eS0wNG0tMDhkLTEwaC01M20tMzBzIENTVCBp
bnRlZ3JhdGlvbiBtYW5pZmVzdA0KDQpBbHJlYWR5IHVwLXRvLWRhdGUuDQoNCj09PT09PVN0YXJ0
IHRvIGFwcGx5IHBhdGNoIGZvciBrZXJuZWwgYnVpbGQ9PT09PT0NCg0KPT1QYXRjaCBwYXRoOiAv
cm9vdC9wYXRjaGVzL2FsZWtzZWkuZ2ltYml0c2tpaS84X0Fwcl8yMDE5XzA4XzU0XzU4LmVtbA0K
DQo9PURFUzogZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBpbnRlbF9ndnRfZ3R0X3R5cGVf
dF88MjAxOTA0MDgwNTU1MDIuODQ3NC0xLWFsZWtzZWkuZ2ltYml0c2tpaUBpbnRlbC5jb208bWFp
bHRvOjIwMTkwNDA4MDU1NTAyLjg0NzQtMS1hbGVrc2VpLmdpbWJpdHNraWlAaW50ZWwuY29tPj4N
Cg0KPT1CZWdpbiB0byBhcHBseSB0aGUgcGF0Y2ggd2l0aCBnaXQgYW09PQ0KDQpBcHBseWluZzog
ZHJtL2k5MTUvZ3Z0OiBSZW1vdmUgdHlwZWRlZiBpbnRlbF9ndnRfZ3R0X3R5cGVfdA0KDQo9PUFw
cGx5IC9yb290L3BhdGNoZXMvYWxla3NlaS5naW1iaXRza2lpLzhfQXByXzIwMTlfMDhfNTRfNTgu
ZW1sIHN1Y2Nlc3NmdWxseT09DQoNCj09QmVnaW4gdG8gbWFrZSBjb25maWc9PQ0KDQogIEhPU1RD
QyAgc2NyaXB0cy9iYXNpYy9maXhkZXANCg0KICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9jb25m
Lm8NCg0KICBIT1NUQ0MgIHNjcmlwdHMva2NvbmZpZy9jb25mZGF0YS5vDQoNCiAgSE9TVENDICBz
Y3JpcHRzL2tjb25maWcvZXhwci5vDQoNCqGtoa0NCmRyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29u
ZGVtYW5kLmM6IEluIGZ1bmN0aW9uIKGub2Rfc2V0X3Bvd2Vyc2F2ZV9iaWFzoa86DQpkcml2ZXJz
L2NwdWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5jOjQ0OToxOiB3YXJuaW5nOiB0aGUgZnJhbWUgc2l6
ZSBvZiAxMDMyIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMgWy1XZnJhbWUtbGFyZ2Vy
LXRoYW49XQ0KfQ0KXg0KZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2hhbmRsZXJzLmM6IEluIGZ1
bmN0aW9uIKGuaGFuZGxlX2cydl9ub3RpZmljYXRpb26hrzoNCmRyaXZlcnMvZ3B1L2RybS9pOTE1
L2d2dC9oYW5kbGVycy5jOjEyMDk6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIKGuaW50ZWxf
Z3Z0X2d0dF90eXBlX3Shrw0KICBpbnRlbF9ndnRfZ3R0X3R5cGVfdCByb290X2VudHJ5X3R5cGUg
PSBHVFRfVFlQRV9QUEdUVF9ST09UX0w0X0VOVFJZOw0KICBeDQpzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI3NTogcmVjaXBlIGZvciB0YXJnZXQgJ2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9oYW5k
bGVycy5vJyBmYWlsZWQNCnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg2OiByZWNpcGUgZm9yIHRh
cmdldCAnZHJpdmVycy9ncHUvZHJtL2k5MTUnIGZhaWxlZA0KbWFrZVs3XTogKioqIFtkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvaGFuZGxlcnMub10gRXJyb3IgMQ0KbWFrZVs2XTogKioqIFtkcml2
ZXJzL2dwdS9kcm0vaTkxNV0gRXJyb3IgMg0KbWFrZVs2XTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4NCnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg2OiByZWNpcGUgZm9yIHRh
cmdldCAnZHJpdmVycy9ncHUvZHJtJyBmYWlsZWQNCnNjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg2
OiByZWNpcGUgZm9yIHRhcmdldCAnZHJpdmVycy9ncHUnIGZhaWxlZA0KbWFrZVs1XTogKioqIFtk
cml2ZXJzL2dwdS9kcm1dIEVycm9yIDINCm1ha2VbNF06ICoqKiBbZHJpdmVycy9ncHVdIEVycm9y
IDINCm1ha2VbNF06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQpkcml2ZXJz
L25ldC9ldGhlcm5ldC9uZXRlcmlvbi92eGdlL3Z4Z2UtbWFpbi5jOiBJbiBmdW5jdGlvbiChrlZY
R0VfQ09NUExFVEVfVlBBVEhfVFguaXNyYS40MKGvOg0KZHJpdmVycy9uZXQvZXRoZXJuZXQvbmV0
ZXJpb24vdnhnZS92eGdlLW1haW4uYzoxMTk6MTogd2FybmluZzogdGhlIGZyYW1lIHNpemUgb2Yg
MTA0OCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzIFstV2ZyYW1lLWxhcmdlci10aGFu
PV0NCn0NCl4NCk1ha2VmaWxlOjEwNTE6IHJlY2lwZSBmb3IgdGFyZ2V0ICdkcml2ZXJzJyBmYWls
ZWQNCm1ha2VbM106ICoqKiBbZHJpdmVyc10gRXJyb3IgMg0KZGViaWFuL3J1bGVzOjY6IHJlY2lw
ZSBmb3IgdGFyZ2V0ICdidWlsZCcgZmFpbGVkDQptYWtlWzJdOiAqKiogW2J1aWxkXSBFcnJvciAy
DQpkcGtnLWJ1aWxkcGFja2FnZTogZXJyb3I6IGRlYmlhbi9ydWxlcyBidWlsZCBnYXZlIGVycm9y
IGV4aXQgc3RhdHVzIDINCnNjcmlwdHMvcGFja2FnZS9NYWtlZmlsZTo3MDogcmVjaXBlIGZvciB0
YXJnZXQgJ2RlYi1wa2cnIGZhaWxlZA0KbWFrZVsxXTogKioqIFtkZWItcGtnXSBFcnJvciAyDQpN
YWtlZmlsZToxMzk2OiByZWNpcGUgZm9yIHRhcmdldCAnZGViLXBrZycgZmFpbGVkDQptYWtlOiAq
KiogW2RlYi1wa2ddIEVycm9yIDINCg0KDQoNCkJlc3QgcmVnYXJkcywNCkhlLFl1DQoNCg==

--_000_C294FBAE55175941838A8D362DCD8AA225ED29C7SHSMSX104ccrcor_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Intel Clear";
	panose-1:2 11 6 4 2 2 3 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:=CB=CE=CC=E5;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Intel Clear",sans-serif;
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Intel Clear",sans-serif;
	color:#1F497D;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Loop Aleksei to rebase=
 his patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> int=
el-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org]
<b>On Behalf Of </b>He, Yu<br>
<b>Sent:</b> Monday, April 8, 2019 4:57 PM<br>
<b>To:</b> intel-gvt-dev@lists.freedesktop.org<br>
<b>Cc:</b> Xu, Terrence &lt;terrence.xu@intel.com&gt;<br>
<b>Subject:</b> RE: e70f0422f03c build failure<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a name=3D"_MailEndCompose"><span style=3D"font-fami=
ly:&quot;Intel Clear&quot;,sans-serif;color:#1F497D">Please help to check, =
thanks!</span></a><span style=3D"font-family:&quot;Intel Clear&quot;,sans-s=
erif;color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif;color:#=
1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif;color:#=
1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif;color:#=
1F497D">Best regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif;color:#=
1F497D">He,Yu<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Xu, Terrence <br>
<b>Sent:</b> 2019<span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5">=
=C4=EA</span>4<span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5">=D4=
=C2</span>8<span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5">=C8=D5</=
span> 16:53<br>
<b>To:</b> He, Yu &lt;<a href=3D"mailto:yu.he@intel.com">yu.he@intel.com</a=
>&gt;<br>
<b>Subject:</b> RE: e70f0422f03c build failure<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=
=E5;color:#1F497D">=CE=D2=B9=C0=BC=C6=CA=C7</span><span style=3D"color:#1F4=
97D">patch</span><span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5;col=
or:#1F497D">=D0=B4=B5=C4=B2=BB=B9=E6=B7=B6=A3=AC=C3=BB=D3=D0=CD=A8=B9=FD=D7=
=EE=D0=C2=B5=C4</span><span style=3D"color:#1F497D">gvt-staging</span><span=
 lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5;color:#1F497D">=C0=B4=D0=
=B4=B6=F8=B5=BC=D6=C2=A1=A3</span><span lang=3D"ZH-CN" style=3D"color:#1F49=
7D">
</span><span style=3D"font-family:Wingdings;color:#1F497D">J</span><span st=
yle=3D"color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=
=E5;color:#1F497D">=BF=C9=D2=D4=D7=AA=B7=A2=B8=F8</span><span style=3D"colo=
r:#1F497D">SSP PRC VGT SH &lt;<a href=3D"mailto:ssp.prc.vgt.sh@intel.com">s=
sp.prc.vgt.sh@intel.com</a>&gt;; SSP PRC VGT BJ
<a href=3D"mailto:ssp.prc.vgt.bj@intel.com">ssp.prc.vgt.bj@intel.com</a></s=
pan><span lang=3D"ZH-CN" style=3D"font-family:=CB=CE=CC=E5;color:#1F497D">=
=BF=B4=BF=B4</span><span style=3D"color:#1F497D"><o:p></o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> He, Yu <br>
<b>Sent:</b> Monday, April 8, 2019 4:52 PM<br>
<b>To:</b> Xu, Terrence &lt;<a href=3D"mailto:terrence.xu@intel.com">terren=
ce.xu@intel.com</a>&gt;<br>
<b>Subject:</b> e70f0422f03c build failure<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"font-size:10.0pt;font-family:&quot;Intel Clear&quot;,sa=
ns-serif;color:#333333">Kernel build failure:<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;font-family:&quot;Intel Clear&quot;,sa=
ns-serif;color:#333333"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333"><o:p>&nbsp;</o:p></span=
></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">&#43; 73d7dd0c4527...e7=
0f0422f03c gvt-staging -&gt; origin/gvt-staging&nbsp; (forced update)<o:p><=
/o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333"> * [new tag]&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; gvt-staging-2019y-04m-08d-10h-53m-30s -&gt; gvt-stag=
ing-2019y-04m-08d-10h-53m-30s<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">HEAD is now at e70f0422=
f03c gvt-staging: 2019y-04m-08d-10h-53m-30s CST integration manifest<o:p></=
o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">Already up-to-date.<o:p=
></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3D=3D=3D=3D=3DStart=
 to apply patch for kernel build=3D=3D=3D=3D=3D=3D<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3DPatch path: /root=
/patches/aleksei.gimbitskii/8_Apr_2019_08_54_58.eml<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3DDES: drm/i915/gvt=
: Remove typedef intel_gvt_gtt_type_t_&lt;<a href=3D"mailto:20190408055502.=
8474-1-aleksei.gimbitskii@intel.com">20190408055502.8474-1-aleksei.gimbitsk=
ii@intel.com</a>&gt;<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3DBegin to apply th=
e patch with git am=3D=3D<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">Applying: drm/i915/gvt:=
 Remove typedef intel_gvt_gtt_type_t<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3DApply /root/patch=
es/aleksei.gimbitskii/8_Apr_2019_08_54_58.eml successfully=3D=3D<o:p></o:p>=
</span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">=3D=3DBegin to make con=
fig=3D=3D<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">&nbsp; HOSTCC&nbsp; scr=
ipts/basic/fixdep<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">&nbsp; HOSTCC&nbsp; scr=
ipts/kconfig/conf.o<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">&nbsp; HOSTCC&nbsp; scr=
ipts/kconfig/confdata.o<o:p></o:p></span></pre>
<pre><span style=3D"font-size:10.0pt;color:#333333">&nbsp; HOSTCC&nbsp; scr=
ipts/kconfig/expr.o<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif">=A1=AD=A1=AD<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/cpufreq/cpufreq_ondemand.c: In function
<span lang=3D"ZH-CN">=A1=AE</span>od_set_powersave_bias<span lang=3D"ZH-CN"=
>=A1=AF</span>:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/cpufreq/cpufreq_ondemand.c:449:1: warning: th=
e frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=
=3D]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/gpu/drm/i915/gvt/handlers.c: In function
<span lang=3D"ZH-CN">=A1=AE</span>handle_g2v_notification<span lang=3D"ZH-C=
N">=A1=AF</span>:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/gpu/drm/i915/gvt/handlers.c:1209:2:
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
error</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:=
#333333">: unknown type name
<span lang=3D"ZH-CN">=A1=AE</span>intel_gvt_gtt_type_t<span lang=3D"ZH-CN">=
=A1=AF</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">&nbsp; intel_gvt_gtt_type_t root_entry_type =3D GTT_T=
YPE_PPGTT_ROOT_L4_ENTRY;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">&nbsp; ^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">scripts/Makefile.build:275: recipe for target 'driver=
s/gpu/drm/i915/gvt/handlers.o' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">scripts/Makefile.build:486: recipe for target 'driver=
s/gpu/drm/i915' failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[7]: *** [drivers/gpu/drm/i915/gvt/handlers.o]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[6]: *** [drivers/gpu/drm/i915]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[6]: *** Waiting for unfinished jobs....<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">scripts/Makefile.build:486: recipe for target 'driver=
s/gpu/drm'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">scripts/Makefile.build:486: recipe for target 'driver=
s/gpu'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[5]: *** [drivers/gpu/drm]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[4]: *** [drivers/gpu]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[4]: *** Waiting for unfinished jobs....<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/net/ethernet/neterion/vxge/vxge-main.c: In fu=
nction
<span lang=3D"ZH-CN">=A1=AE</span>VXGE_COMPLETE_VPATH_TX.isra.40<span lang=
=3D"ZH-CN">=A1=AF</span>:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">drivers/net/ethernet/neterion/vxge/vxge-main.c:119:1:=
 warning: the frame size of 1048 bytes is larger than 1024 bytes [-Wframe-l=
arger-than=3D]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">^<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">Makefile:1051: recipe for target 'drivers'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[3]: *** [drivers] Error 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">debian/rules:6: recipe for target 'build'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[2]: *** [build] Error 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">dpkg-buildpackage: error: debian/rules build gave err=
or exit status 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">scripts/package/Makefile:70: recipe for target 'deb-p=
kg'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make[1]: *** [deb-pkg]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">Makefile:1396: recipe for target 'deb-pkg'
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
failed</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:=CB=CE=
=CC=E5;color:#333333">make: *** [deb-pkg]
</span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color:red">=
Error </span><span style=3D"font-size:10.0pt;font-family:=CB=CE=CC=E5;color=
:#333333">2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Intel Clear&quot;,s=
ans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif"><o:p>&=
nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif">Best r=
egards,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-family:&quot;Intel Clear&quot;,sans-serif">He,Yu<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_C294FBAE55175941838A8D362DCD8AA225ED29C7SHSMSX104ccrcor_--

--===============1577473762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1577473762==--
