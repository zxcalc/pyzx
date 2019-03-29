// Initial wiring: [10, 4, 6, 12, 15, 8, 18, 5, 11, 9, 2, 7, 19, 14, 3, 16, 17, 13, 0, 1]
// Resulting wiring: [10, 4, 6, 12, 15, 8, 18, 5, 11, 9, 2, 7, 19, 14, 3, 16, 17, 13, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[6], q[3];
cx q[8], q[2];
cx q[16], q[13];
cx q[16], q[17];
cx q[11], q[18];
