// Initial wiring: [5 1 2 3 4 0 8 7 6]
// Resulting wiring: [5 1 2 8 4 0 3 7 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[8], q[3];
cx q[0], q[1];
cx q[5], q[6];
cx q[2], q[3];
cx q[7], q[8];
