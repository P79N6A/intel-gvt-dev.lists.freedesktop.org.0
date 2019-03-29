Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp1752752ywb;
        Fri, 29 Mar 2019 05:02:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1fXe0TM0MAAcYt0VSFOEN54NQIU51NVR4Cbk7r44aSPSZPxpVidvfxU/0iGQTDus2Ku9j
X-Received: by 2002:a62:4290:: with SMTP id h16mr46839865pfd.8.1553860922011;
        Fri, 29 Mar 2019 05:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553860922; cv=none;
        d=google.com; s=arc-20160816;
        b=fvew1CpXJmTdihoRaUtRVFKIQOA/+NKEVO6kWmlsIqlylk64LHOlwCFCt97kltisue
         p/Sccr0JqmpqUJszMJ/MwBtqYfeFjnl0AdIRFvcz6E3lNQyjgVoaMhrweB66GjOeZIib
         h5qFFgXbVBnfpkOdWW5uZ58MpaeDipacq9o1sjwfr9ngMWkCT3JKu7qDenV/zXOxbcDI
         H/VTM0yZ+uE+zWOj+JjnBMRpItYrk3EYiqpufKm/nEGj+ThOvWhb8JU2uYMFKx5W8tN9
         QJPB89X5aZajUbnpW6BIIwyAQ/wgEwbjWwdRe210ivFjtw6cy/h24GQc938eW9Hd/jZ0
         /Ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:content-id:nodisclaimer:user-agent
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:delivered-to;
        bh=ko+2tbTD4r2hKF3TTxp9P4z0HsfZuaJbXJCNLZHX1Mo=;
        b=rA9MylpmWHt8eamYXO617toSP1DGPzDTClj9/1rRTIytvBm1Wj86NBqfhahwmXJTNi
         p7IReDY1LIiDXUHAPYVDZQ9AQoDi+iaDv5rduxbJDN+CkjFhc4wvvI6dDB8MweyzSaKa
         ZyAGi1okTX8pj1UacshRa02HF0v3aVW/WZVMn8R/SQevoxey3D9xkquSjH28IhhMl/SC
         jfQVwN1Js62rGC2l6bsO3/DcCA+1ryCiBOPVtjGraW7wCB/IxB4bfDfnh4Z/DdgjxXT0
         MQ/6maWajD4nknCW2gCdR7N2AcPykttf4bZG4i+BZ6BwvArmPi1bSOuG9sdeu7XkSI3P
         bO1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id u11si1682862pgp.205.2019.03.29.05.02.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Mar 2019 05:02:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDEA6E8CB;
	Fri, 29 Mar 2019 12:02:00 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20043.outbound.protection.outlook.com [40.107.2.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EF46E8CA;
 Fri, 29 Mar 2019 12:01:59 +0000 (UTC)
Received: from DB6PR0801MB1990.eurprd08.prod.outlook.com (10.168.81.21) by
 DB6PR0801MB1688.eurprd08.prod.outlook.com (10.169.226.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Fri, 29 Mar 2019 12:01:56 +0000
Received: from DB6PR0801MB1990.eurprd08.prod.outlook.com
 ([fe80::1150:dc18:a9dc:e17f]) by DB6PR0801MB1990.eurprd08.prod.outlook.com
 ([fe80::1150:dc18:a9dc:e17f%2]) with mapi id 15.20.1750.017; Fri, 29 Mar 2019
 12:01:56 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] drm: prefix header search paths with $(srctree)/
Thread-Topic: [PATCH v2] drm: prefix header search paths with $(srctree)/
Thread-Index: AQHU5ic0uA1of+s1B0+BwMzAq+HTEA==
Date: Fri, 29 Mar 2019 12:01:56 +0000
Message-ID: <20190329120149.GA16140@james-ThinkStation-P300>
References: <1553859161-2628-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553859161-2628-1-git-send-email-yamada.masahiro@socionext.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0015.apcprd03.prod.outlook.com
 (2603:1096:203:2e::27) To DB6PR0801MB1990.eurprd08.prod.outlook.com
 (2603:10a6:4:6c::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb5f5f4f-6f44-40cc-2d00-08d6b43e56db
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DB6PR0801MB1688; 
x-ms-traffictypediagnostic: DB6PR0801MB1688:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <DB6PR0801MB16881C821719F004EFA77423B35A0@DB6PR0801MB1688.eurprd08.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(26005)(4326008)(33656002)(6116002)(478600001)(25786009)(229853002)(476003)(102836004)(52116002)(55236004)(6916009)(11346002)(6506007)(386003)(14454004)(446003)(76176011)(186003)(8936002)(71190400001)(71200400001)(1076003)(316002)(486006)(8676002)(3846002)(99286004)(66066001)(966005)(256004)(6306002)(81156014)(6512007)(97736004)(54906003)(6436002)(6246003)(305945005)(6486002)(81166006)(9686003)(2906002)(53936002)(105586002)(86362001)(33716001)(7416002)(68736007)(106356001)(58126008)(7736002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1688;
 H:DB6PR0801MB1990.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pt6BzTL5z1pEa36GU2198+bImorgeMwp0ynEpBjp52ViumtHNgVPco4H0ETiGPeMJD+sIj8EtY2YUH9prScVSBNqVwVX5QCwnatMbTE4EuDArdlEu7Pd1OH/hYm64CbXHDTUFRF3BihZCWlIM9xRraSzzHHKKhTOzTtl/17a/fpoMxgHXnHLjdov1/ys8ZcyFHUjzH0FV3X2FdRx4fx58BtsE/WluPeDukeGtcbkAA7MK6FC3l5NiM9+LCUSXi7GdSI0W+YqZnYQD/3WT2gkeSLLmEcWAvdrch7sq+t+5XEDn2Xc20/dFWoEQa0cXVoinozy77dna11MSgN+G32DytuqOLWX6TOC4VNVHGrituJF1akM68tZBacfzrvWuNnQkpMVgiB+kubYFfzZlL7zwN5w3U9/T1+WE6Dtxnu2VXk=
Content-ID: <865BFCE5FA227C4B89CF3E89C08B15E5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5f5f4f-6f44-40cc-2d00-08d6b43e56db
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 12:01:56.4556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1688
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYWtsYZK2d4KlPP7viu+UdAGNHbrWcT0FTNGl0XwEvY=;
 b=JP6uAtrWU4GtiMIyGyckXvb6w9dCL8L9aFRfT8FQmcQ7nxJQirhih/ssfF/e+SFZneUmAnItPzo0NboapQNb7Mh7rjlh1/L4PmL3kHw01MtPYRn1Yc9w+boHD4kzpbDiAUjzGVj2/caoX3h1mXrOHqtBxBTXocmk3KwHILEacHU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, Sean Paul <sean@poorly.run>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nd <nd@arm.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 Brian Starkey <Brian.Starkey@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXIgMjksIDIwMTkgYXQgMDg6MzI6NDFQTSArMDkwMCwgTWFzYWhpcm8gWWFtYWRh
IHdyb3RlOgo+IEN1cnJlbnRseSwgdGhlIEtidWlsZCBjb3JlIG1hbmlwdWxhdGVzIGhlYWRlciBz
ZWFyY2ggcGF0aHMgaW4gYSBjcmF6eQo+IHdheSBbMV0uCj4gCj4gVG8gZml4IHRoaXMgbWVzcywg
SSB3YW50IGFsbCBNYWtlZmlsZXMgdG8gYWRkIGV4cGxpY2l0ICQoc3JjdHJlZSkvIHRvCj4gdGhl
IHNlYXJjaCBwYXRocyBpbiB0aGUgc3JjdHJlZS4gU29tZSBNYWtlZmlsZXMgYXJlIGFscmVhZHkg
d3JpdHRlbiBpbgo+IHRoYXQgd2F5LCBidXQgbm90IGFsbC4gVGhlIGdvYWwgb2YgdGhpcyB3b3Jr
IGlzIHRvIG1ha2UgdGhlIG5vdGF0aW9uCj4gY29uc2lzdGVudCwgYW5kIGZpbmFsbHkgZ2V0IHJp
ZCBvZiB0aGUgZ3Jvc3MgaGFja3MuCj4gCj4gSGF2aW5nIHdoaXRlc3BhY2VzIGFmdGVyIC1JIGRv
ZXMgbm90IG1hdHRlciBzaW5jZSBjb21taXQgNDhmNmUzY2Y1YmM2Cj4gKCJrYnVpbGQ6IGRvIG5v
dCBkcm9wIC1JIHdpdGhvdXQgcGFyYW1ldGVyIikuCj4gCj4gWzFdOiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzk2MzIzNDcvCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8g
WWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiBSZXZpZXdlZC1ieTogU2Ft
IFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+IC0tLQo+IAo+IEkgcHV0IGFsbCBncHUvZHJt
IGNoYW5nZXMgaW50byBhIHNpbmdsZSBwYXRjaCBiZWNhdXNlCj4gdGhleSBhcmUgdHJpdmlhbCBj
b252ZXJzaW9uLgo+IAo+IElmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiB0aGUgYmlnIHBpY3R1cmUg
b2YgdGhpcyB3b3JrLAo+IHRoZSBmdWxsIHBhdGNoIHNldCBpcyBhdmFpbGFibGUgYXQgdGhlIGZv
bGxvd2luZyBVUkwuCj4gCj4gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L21hc2FoaXJveS9saW51eC1rYnVpbGQuZ2l0IGJ1aWxkLXRlc3QKPiAKPiAKPiBDaGFu
Z2VzIGluIHYyOgo+ICAgLSBmaXggdXAgdGhlIG5ldyBkcml2ZXIga29tZWRhCj4gICAtIEFkZCBT
YW0ncyBSZXZpZXdlZC1ieQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmls
ZSAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2xpYi9NYWtlZmlsZSAgICAg
ICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2Vm
aWxlIHwgNCArKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9NYWtlZmlsZSAgICAgICAg
ICAgfCAyICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vTWFrZWZpbGUgICAgICAgICAgICAgICAg
fCA2ICsrKy0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQgICAgICAgICAgICAg
IHwgOCArKysrLS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9N
YWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gaW5kZXggNDY2
ZGE1OS4uNjJiZjlkYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9N
YWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L01ha2VmaWxlCj4gQEAg
LTIzLDcgKzIzLDcgQEAKPiAgIyBNYWtlZmlsZSBmb3IgdGhlIGRybSBkZXZpY2UgZHJpdmVyLiAg
VGhpcyBkcml2ZXIgcHJvdmlkZXMgc3VwcG9ydCBmb3IgdGhlCj4gICMgRGlyZWN0IFJlbmRlcmlu
ZyBJbmZyYXN0cnVjdHVyZSAoRFJJKSBpbiBYRnJlZTg2IDQuMS4wIGFuZCBoaWdoZXIuCj4gIAo+
IC1GVUxMX0FNRF9QQVRIPSQoc3JjKS8uLgo+ICtGVUxMX0FNRF9QQVRIPSQoc3JjdHJlZSkvJChz
cmMpLy4uCj4gIERJU1BMQVlfRk9MREVSX05BTUU9ZGlzcGxheQo+ICBGVUxMX0FNRF9ESVNQTEFZ
X1BBVEggPSAkKEZVTExfQU1EX1BBVEgpLyQoRElTUExBWV9GT0xERVJfTkFNRSkKPiAgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvbGliL01ha2VmaWxlIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9saWIvTWFrZWZpbGUKPiBpbmRleCA2OTAyNDMwLi5kNTM0OTkyIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvbGliL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9saWIvTWFrZWZpbGUKPiBAQCAtMjcsNiArMjcsNiBAQAo+ICAjIGRyaXZlciBjb21w
b25lbnRzIG9yIGxhdGVyIG1vdmVkIHRvIGtlcm5lbC9saWIgZm9yIHNoYXJpbmcgd2l0aAo+ICAj
IG90aGVyIGRyaXZlcnMuCj4gIAo+IC1jY2ZsYWdzLXkgOj0gLUkkKHNyYykvLi4vaW5jbHVkZQo+
ICtjY2ZsYWdzLXkgOj0gLUkgJChzcmN0cmVlKS8kKHNyYykvLi4vaW5jbHVkZQo+ICAKPiAgb2Jq
LSQoQ09ORklHX0NIQVNIKSArPSBjaGFzaC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL01ha2VmaWxlCj4gaW5kZXggMWI4NzVlNS4uYTcyZTMwYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQo+IEBAIC0xLDggKzEsOCBA
QAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gIAo+ICBjY2ZsYWdzLXkg
Oj0gXAo+IC0JLUkkKHNyYykvLi4vaW5jbHVkZSBcCj4gLQktSSQoc3JjKQo+ICsJLUkgJChzcmN0
cmVlKS8kKHNyYykvLi4vaW5jbHVkZSBcCj4gKwktSSAkKHNyY3RyZWUpLyQoc3JjKQo+ICAKPiAg
a29tZWRhLXkgOj0gXAo+ICAJa29tZWRhX2Rydi5vIFwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Z0L01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L01ha2Vm
aWxlCj4gaW5kZXggMjcxZmI0Ni4uZWE4MzI0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndnQvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvTWFr
ZWZpbGUKPiBAQCAtNSw1ICs1LDUgQEAgR1ZUX1NPVVJDRSA6PSBndnQubyBhcGVydHVyZV9nbS5v
IGhhbmRsZXJzLm8gdmdwdS5vIHRyYWNlX3BvaW50cy5vIGZpcm13YXJlLm8gXAo+ICAJZXhlY2xp
c3QubyBzY2hlZHVsZXIubyBzY2hlZF9wb2xpY3kubyBtbWlvX2NvbnRleHQubyBjbWRfcGFyc2Vy
Lm8gZGVidWdmcy5vIFwKPiAgCWZiX2RlY29kZXIubyBkbWFidWYubyBwYWdlX3RyYWNrLm8KPiAg
Cj4gLWNjZmxhZ3MteQkJCQkrPSAtSSQoc3JjKSAtSSQoc3JjKS8kKEdWVF9ESVIpCj4gK2NjZmxh
Z3MteQkJCQkrPSAtSSAkKHNyY3RyZWUpLyQoc3JjKSAtSSAkKHNyY3RyZWUpLyQoc3JjKS8kKEdW
VF9ESVIpLwo+ICBpOTE1LXkJCQkJCSs9ICQoYWRkcHJlZml4ICQoR1ZUX0RJUikvLCAkKEdWVF9T
T1VSQ0UpKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL01ha2VmaWxlIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZQo+IGluZGV4IDU2YTcwYzcuLmI3YjFlYmQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vTWFrZWZpbGUKPiBAQCAtMSw3ICsxLDcgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAo+IC1jY2ZsYWdzLXkgOj0gLUlkcml2ZXJzL2dwdS9kcm0vbXNtCj4g
LWNjZmxhZ3MteSArPSAtSWRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxCj4gLWNjZmxhZ3Mt
JChDT05GSUdfRFJNX01TTV9EU0kpICs9IC1JZHJpdmVycy9ncHUvZHJtL21zbS9kc2kKPiArY2Nm
bGFncy15IDo9IC1JICQoc3JjdHJlZSkvJChzcmMpCj4gK2NjZmxhZ3MteSArPSAtSSAkKHNyY3Ry
ZWUpLyQoc3JjKS9kaXNwL2RwdTEKPiArY2NmbGFncy0kKENPTkZJR19EUk1fTVNNX0RTSSkgKz0g
LUkgJChzcmN0cmVlKS8kKHNyYykvZHNpCj4gIAo+ICBtc20teSA6PSBcCj4gIAlhZHJlbm8vYWRy
ZW5vX2RldmljZS5vIFwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1
aWxkIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2J1aWxkCj4gaW5kZXggZWEzMDM1ZS4uNGZh
ZTcyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LYnVpbGQKPiBAQCAtMSw3ICsxLDcgQEAKPiAtY2Nm
bGFncy15ICs9IC1JJChzcmMpL2luY2x1ZGUKPiAtY2NmbGFncy15ICs9IC1JJChzcmMpL2luY2x1
ZGUvbnZrbQo+IC1jY2ZsYWdzLXkgKz0gLUkkKHNyYykvbnZrbQo+IC1jY2ZsYWdzLXkgKz0gLUkk
KHNyYykKPiArY2NmbGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpL2luY2x1ZGUKPiArY2Nm
bGFncy15ICs9IC1JICQoc3JjdHJlZSkvJChzcmMpL2luY2x1ZGUvbnZrbQo+ICtjY2ZsYWdzLXkg
Kz0gLUkgJChzcmN0cmVlKS8kKHNyYykvbnZrbQo+ICtjY2ZsYWdzLXkgKz0gLUkgJChzcmN0cmVl
KS8kKHNyYykKPiAgCj4gICMgTlZLTSAtIEhXIHJlc291cmNlIG1hbmFnZXIKPiAgIy0gY29kZSBh
bHNvIHVzZWQgYnkgdmFyaW91cyB1c2Vyc3BhY2UgdG9vbHMvdGVzdHMKPiAtLSAKPiAyLjcuNAoK
LS0gClJldmlld2VkLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmludGVsLWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRldg==
