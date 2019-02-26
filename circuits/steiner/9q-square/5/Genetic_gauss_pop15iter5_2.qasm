// Initial wiring: [0 1 2 3 5 4 6 8 7]
// Resulting wiring: [0 1 2 3 5 4 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[4], q[1];
cx q[1], q[2];
cx q[4], q[7];
