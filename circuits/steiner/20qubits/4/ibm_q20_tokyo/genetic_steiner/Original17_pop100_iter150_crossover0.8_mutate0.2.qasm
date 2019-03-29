// Initial wiring: [1, 3, 6, 0, 14, 7, 8, 11, 15, 5, 12, 9, 4, 17, 2, 19, 18, 13, 16, 10]
// Resulting wiring: [1, 3, 6, 0, 14, 7, 8, 11, 15, 5, 12, 9, 4, 17, 2, 19, 18, 13, 16, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[13], q[14];
cx q[11], q[18];
cx q[7], q[12];
