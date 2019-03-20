// Initial wiring: [1 0 2 3 4 7 5 8 6]
// Resulting wiring: [1 0 2 8 4 7 5 3 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[2], q[1];
cx q[3], q[4];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[6], q[5];
cx q[2], q[3];
