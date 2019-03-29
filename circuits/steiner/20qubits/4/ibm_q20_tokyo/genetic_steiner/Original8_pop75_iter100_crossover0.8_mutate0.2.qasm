// Initial wiring: [19, 16, 6, 4, 5, 15, 17, 11, 13, 10, 1, 2, 12, 0, 7, 14, 18, 3, 8, 9]
// Resulting wiring: [19, 16, 6, 4, 5, 15, 17, 11, 13, 10, 1, 2, 12, 0, 7, 14, 18, 3, 8, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[18];
cx q[6], q[13];
cx q[5], q[14];
cx q[5], q[6];
