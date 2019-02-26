// Initial wiring: [5 1 2 8 3 0 7 6 4]
// Resulting wiring: [5 1 2 8 3 0 7 6 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[4];
cx q[5], q[6];
