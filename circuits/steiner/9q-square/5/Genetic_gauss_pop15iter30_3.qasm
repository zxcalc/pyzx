// Initial wiring: [5 1 2 4 8 0 6 7 3]
// Resulting wiring: [5 1 2 4 8 0 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[3], q[4];
cx q[0], q[1];
cx q[5], q[4];
cx q[2], q[3];
