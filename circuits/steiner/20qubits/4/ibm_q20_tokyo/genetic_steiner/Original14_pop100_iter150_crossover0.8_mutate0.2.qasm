// Initial wiring: [5, 10, 7, 4, 6, 3, 13, 18, 9, 12, 1, 2, 15, 16, 17, 8, 11, 19, 14, 0]
// Resulting wiring: [5, 10, 7, 4, 6, 3, 13, 18, 9, 12, 1, 2, 15, 16, 17, 8, 11, 19, 14, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[5];
cx q[8], q[2];
cx q[18], q[12];
cx q[11], q[18];
